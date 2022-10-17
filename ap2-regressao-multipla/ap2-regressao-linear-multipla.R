library(tidyverse)
library(magrittr)
library(ggplot2)
library(dplyr)

path <- "./songs_normalize.csv"
spotify <- read.csv(path)
#organizando músicas por popularidade: artista, música e popularidade
spotify %>% top_n(10,popularity) %>% select(artist, song, popularity) %>% arrange(desc(popularity))

summary(spotify)

m2 <- lm(popularity ~ acousticness + danceability + energy + instrumentalness + loudness + (energy * loudness) + (acousticness * instrumentalness), data=spotify)

summary(m2)

plot(m2)