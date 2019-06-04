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


datesData <- seq(as.Date('2019-01-01'), as.Date('2019-05-31') , by ='week')
tweetsData <- list()
for(d in 1: (length(datesData)-1)) {
  
  print(paste0('Starting for date: ', datesData[d]))
  tweetsData[[d]] <- searchTwitter("tsla + TESLA + TSLA", 
                                   n=5000,
                                   since = as.character(datesData[d]),
                                   until = as.character(datesData[d+1]))
  
}


saveRDS(tweetsData,"tweetsData.rds")
