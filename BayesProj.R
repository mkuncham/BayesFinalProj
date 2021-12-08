## Bayes Project- Cleaning Tweets Code
## Jeannette Jiang, Malvika Kuncham, Jaya Vellayan

library(rtweet) # To get emojis dataset
library(stringr)
library(qdap)

# Preprocessing tweets
bayestweets <- read.csv("Bayes_tweets.csv", header=T)
colnames(bayestweets) <- 'text'

bayestweets2 <- bayestweets
bayestweets2$text <- gsub("http(s)?://t.co/[[:graph:]]*", "",bayestweets2$text)
bayestweets2$text <- gsub("\n", " ", bayestweets2$text)
bayestweets2$text <- gsub("&amp(;|,)?", "&", bayestweets2$text)
bayestweets2$text <- gsub("@\\w+", "", bayestweets2$text)
bayestweets2$text <- gsub("(?![#'])[[:punct:]]", "", bayestweets2$text, perl=TRUE)
bayestweets2$text <- str_remove_all(string = bayestweets2$text, pattern = '[:emoji:]')
bayestweets2$text <- str_trim(bayestweets2$text)
bayestweets2$text <- tolower(bayestweets2$text)
bayestweets2$nobad <- gsub("bad", "", bayestweets2$text)
bayestweets2$nobad <- str_squish(bayestweets2$nobad)

write.csv(bayestweets2, "cleanedbayestweets.csv", row.names=F)
