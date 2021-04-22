library(twitteR)
consumer_key = '5k6YW9hGYcmjZQKA3SgV8WaKj'
consumer_secret = 'qiFWNQHwakkZiWlRIaDfd05zq7hJ6d8T4TLLAi08ylRhZwNizx'
access_key = '1082654918987694083-DhNd1zerKLI5lvlTdCaTIhkK8Xm1gA'
access_secret = 'CHYHMUm7wwdfnYPZzbpfsTo9BMvk9nMIwga0pqChJG1aM'
setup_twitter_oauth(consumer_key, consumer_secret, access_key, access_secret)
rdmTweets <- userTimeline("tensorflow", n=200)
#(nDocs <- length(rdmTweets))
rdmTweets
df <- twListToDF(rdmTweets)
system.time(df$created <- as.Date(df$created))
write.csv(df,"TweetMining.csv")
plot(df$created,df$retweetCount,type="l")
plot(df$created,df$favoriteCount,type="l")