library(tidyverse)
library(magrittr)
library(ggplot2)

spotify_path <- read.csv("./songs_normalize.csv")

data_spotify <- data.frame(
  alto = c(spotify_path$loudness),
  positiva = c(spotify_path$valence),
  dancavel = c(spotify_path$danceability),
  energia = c(spotify_path$energy)
)

data_spotify %>% top_n(10,alto) %>% arrange(desc(alto))

plot(data_spotify)

multiple.regression = lm(alto ~ positiva + dancavel + energia, data=data_spotify)
summary(multiple.regression)

plot(multiple.regression)