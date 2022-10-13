#Accessing the Reddit API
library(httr)
library(jsonlite)
install.packages("RedditExtractoR")
library(RedditExtractoR)

response <- POST("https://www.reddit.com/api/v1/access_token",
                 authenticate('5kqQYg_V6_18xwR9wLsPWA', 'zj0JIti9j6YZjMTvzLLVJ05TWTKn0A'),
                 user_agent("Fetching_Posts_script "),
                 body = list(grant_type="password", 
                             username="Green_Height5567", 
                             password="BvB19121909"))
access_token_json <- rawToChar(response$content)
access_token_content <- fromJSON(access_token_json)
access_token <- access_token_content$access_token
access_token


links <- find_thread_urls(
  keywords = 'medication',
  sort_by = "new",
  subreddit = 'spirituality',
  period = "all"
)

content <- get_thread_content(links$url[1:4])
threads <- content$threads
comments <- content$comments
