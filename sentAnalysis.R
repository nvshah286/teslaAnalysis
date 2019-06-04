# Links

## https://medium.com/@tomyuz/a-sentiment-analysis-approach-to-predicting-stock-returns-d5ca8b75a42
## https://sraf.nd.edu/textual-analysis/code/



# Load Requried Packages
library("SnowballC")
library("tm")
library("twitteR")
library("syuzhet")
library(dplyr)

source('importTwitterData.R')

## getting the sentiment score for each tweet 
word.df <- as.vector(tslaClean)
emotion.df <- get_nrc_sentiment(word.df)
emotion.df2 <- cbind(tslaClean, emotion.df) 
head(emotion.df2)

## chart 1 for the studying the emotions
barplot(apply(emotion.df, MARGIN = 2,sum))


## chart 2 for studying the sentiments 
sent.value <- get_sentiment(word.df)
sent.value2 <- cbind.data.frame(tslaDF, sent.value)
sent.value2$created <- format(sent.value2$created, "%Y-%m-%d")


timeSerSent <- sent.value2 %>% group_by(created) %>% summarise(sentscore = mean(sent.value))


plot(x = as.Date(timeSerSent$created), y = timeSerSent$sentscore, type ='b', main = ' Sent Score for TSLA tweets')
