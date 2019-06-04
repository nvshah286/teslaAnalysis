library(quantmod)



## getting TSLA prices.. 
tsla <- getSymbols('TSLA',auto.assign = F)
saveRDS(tsla, 'tslaprices.rds')

## getting the daily returns.
tslaDR <- dailyReturn(tsla)


## joining the with sent score on dates 
compareDF <- merge(timeSerSent, tslaDR,by.x = 'created',by.y = 'row.names')
colnames(compareDF) <- c('Date', 'SentScore','DailyReturns')


## running a linear regression model 
m1 <- lm(DailyReturns ~ SentScore, data = compareDF)

## analyzing the results. 
summary(m1)


## doing time series model
plot(m1)


## analyze results 


## Compare models 


## recommend one
