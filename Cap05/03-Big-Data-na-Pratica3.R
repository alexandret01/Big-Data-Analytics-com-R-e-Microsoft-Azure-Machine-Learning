#Pergunta: Quais clubes mais realizam transações 
#de compra e venda de jogadores, entre si?
#Dataset Kaggle: https://www.kaggle.com/hugomathien/soccer

#Diretório
setwd("~/Documentos/BigDataAnalytics-R-Azure2.0/Cap05/")

#Pacotes
install.packages("RSQLite")
install.packages("dplyr")
install.packages("tidyr")
install.packages("arules")
install.packages("arulesSequences")
install.packages("readr")
install.packages("visNetwork")
install.packages("igraph")
install.packages("lubridate")
install.packages("DT")

library(RSQLite)
library(dplyr)
library(tidyr)
library(arules)
library(arulesSequences)
library(readr)
library(stringr)
library(visNetwork)
library(igraph)
library(lubridate)
library(DT)

#Conectando no banco de dados
con = dbConnect(RSQLite::SQLite(), dbname="arq/database.sqlite")

#Obtendo a lista de tabelas
alltables = dbListTables(con)
alltables

#Extraindo as tabelas
players       = dbReadTable(con, "Player")
players_stats = dbReadTable(con, "Player_Attributes")
teams         = dbReadTable(con, "Team")
league        = dbReadTable(con, "League")
Matches       = dbReadTable(con, "Match")

View(players)
View(players_stats)
View(teams)
View(league)
View(Matches)

#Substituindo espaço por underline nos nome muito longos
teams$team_long_name = str_replace_all(teams$team_long_name, "\\s", "_")
teams$team_long_name = str_replace_all(teams$team_long_name, "\\.", "_")
teams$team_long_name = str_replace_all(teams$team_long_name, "-", "_")
View(teams)

#Agrupando as equipes por país
CountryClub = Matches %>% 
  group_by(home_team_api_id,country_id) %>% 
  summarise(n=n()) %>% 
  left_join(league) %>%
  left_join(teams, by=c("home_team_api_id" = "team_api_id"))

#Os jogadores estão em colunas separadas
tmp = Matches %>% 
  select(
    season, 
    home_team_api_id, 
    home_player_1:home_player_11
  )%>%
  gather(
    player, 
    player_api_id, 
    -c(season, home_team_api_id)
  ) %>%
  group_by(player_api_id, home_team_api_id ) %>% 
  summarise(season = min(season))

#Unindo dados de jogador e clube
playerClubSequence = left_join(
  tmp,
  players
) %>% 
  left_join(
    teams, 
    by=c("home_team_api_id"="team_api_id")
  )

playerClubSequence = playerClubSequence %>% 
  filter(
    !is.na(player_name), !is.na(team_short_name)
  )  %>%
  arrange(
    player_api_id, 
    season
  )

#Adicionando um número sequencial por jogador
playerClubSequence$seqnr = ave( playerClubSequence$player_api_id, playerClubSequence$player_api_id, FUN = seq_along)
playerClubSequence$size = 1

#Grava o conjunto de dados em um arquivo txt
write_delim( 
  playerClubSequence %>% select( c(player_api_id, seqnr, size, team_long_name)) ,
  delim ="\t", path = "player_transactions.txt", col_names = FALSE
)


#Importamos as transações registradas
playerstrxs <- read_baskets("player_transactions.txt", sep = "[ \t]+",info =  c("sequenceID","eventID","size"))
summary(playerstrxs)

#Executar mineração de sequência
?cspade

playersClubSeq <- cspade(
  playerstrxs, 
  parameter = list(support = 0.00010, maxlen=2), 
  control   = list(verbose = TRUE)
)

summary(playersClubSeq)

#Fazendo Data Wrangling 
seqResult = as(playersClubSeq, "data.frame")
seqResult = seqResult %>% 
  mutate(
    sequence = as.character(sequence)
  )

seqResult = bind_cols(
  seqResult,
  as.data.frame(
    str_split_fixed(seqResult$sequence, pattern =",", 2), 
    stringsAsFactors = FALSE)
)

seqResult$from = str_extract_all(seqResult$V1,"\\w+", simplify = TRUE)[,1] 
seqResult$to   = str_extract_all(seqResult$V2,"\\w+",simplify = TRUE)[,1]

seqResult$width = exp(3000*seqResult$support)
seqResult = seqResult %>% filter(V2 !="")
seqResult$title = paste(seqResult$sequence, "<br>", round(100*seqResult$support,2), "%")

seqResult$support_perc = paste(sprintf("%.4f", 100*seqResult$support), "%")

#Criando o dataframe com os nodes
nodes = unique(c(seqResult$from, seqResult$to))
nodesData = data.frame(id = unique(nodes), title = unique(nodes), label = unique(nodes), stringsAsFactors = FALSE) %>%
  left_join(CountryClub, by = c("id"="team_long_name")) %>% 
  rename(group = name)

View(nodes)

#Nós no gráfico de rede
transferGraph = graph_from_data_frame(seqResult[,c(5,6)], directed = TRUE)

tmp = betweenness(transferGraph)
Clubs_betweenness = data.frame(id = names(tmp), value = tmp, stringsAsFactors = FALSE)
nodesData = nodesData %>% 
  left_join(Clubs_betweenness) %>%
  mutate(title = paste(id, "betweeness ", round(value))) %>%
  arrange(id)

#Preparando o dataframe final e removendo duplicidades
nodes = nodesData
nodes = nodes[!duplicated(nodes$id),]

#Cria a rede
?visNetwork

visNetwork(nodes, edges = seqResult, width = 900, height = 700) %>%
  visNodes(size = 10) %>%
  visLegend() %>%
  visEdges(smooth = FALSE) %>%
  visOptions(highlightNearest = TRUE, nodesIdSelection = TRUE) %>%
  visInteraction(navigationButtons = TRUE) %>%
  visEdges(arrows = 'from') %>%
  visPhysics(
    solver = "barnesHut",
    maxVelocity = 35,
    forceAtlas2Based = list(gravitationalConstant = -6000)
  )

#Cria a tabela final para suportar a análise
seqResult$Ntransctions = seqResult$support*10542
DT::datatable(
  seqResult[,c(5,6,9,10)], 
  rownames = FALSE,
  options = list(
    pageLength=25)
)

