# Load Requried Packages
library("SnowballC")
library("tm")
library("twitteR")
library("syuzhet")

# Link for article 
## http://dataaspirant.com/2018/03/22/twitter-sentiment-analysis-using-r/

# wordcloud
## http://www.sthda.com/english/wiki/text-mining-and-word-cloud-fundamentals-in-r-5-simple-steps-you-should-know

consumer_key <- 'uywh7uc6DPHYhJ73mEeLOfF5q'
consumer_secret <- '2LwWl7DsiDbxCi47J5cagTISIjX2NUb5ndLJHz62oiB8cEWHYH'
access_token <- '111816960-4AL3NF2ZB8QRcHEZpc1mZwM9S03e2eZtGHpKYWs9'
access_secret <- 'jWBqIHZoqAeuQ0YudODF2z969dsR4PS0er3QmcpEHec5A'


setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
Ytweets <- searchTwitter("tsla + TESLA + TSLA", n=10000, re)


## data cleaning on tweets 
tslaDF <- twListToDF(Ytweets)


tslaClean <- gsub("http.*","",tslaDF$text)
tslaClean <- gsub("https.*","",tslaClean)
tslaClean <- gsub("#.*","",tslaClean)

## getting the sentiment score for each tweet 
word.df <- as.vector(tslaClean)
emotion.df <- get_nrc_sentiment(word.df)
emotion.df2 <- cbind(tslaClean, emotion.df) 
head(emotion.df2)


sent.value <- get_sentiment(word.df)
most.positive <- word.df[sent.value == max(sent.value)]
most.positive



## Wordcloud 
docs = C