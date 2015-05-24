pkgs <- c('httr', 'httpuv', 'rjson')
install.packages(pkgs)

library(httr)
library(httpuv)
library(rjson)




# 1. Find OAuth settings for github:

#    http://developer.github.com/v3/oauth/

oauth_endpoints("github")




# 2. To make your own application, register at at

#    https://github.com/settings/applications. Use any URL for the homepage URL

#    (http://github.com is fine) and  http://localhost:1410 as the callback url

#

#    Replace your key and secret below.

myapp <- oauth_app("github",

  key = "b36119fe52f6f5053b69",

  secret = "1eba882daa45f124cbe7e0bdad143ce648fa8f71")




# 3. Get OAuth credentials

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)




# 4. Use API

gtoken <- config(token = github_token)

# req <- GET("https://api.github.com/rate_limit", gtoken)
# req_raw <- GET("https://api.github.com/users/jtleek/repos", gtoken)
# stop_for_status(req)
# req_JSON <- fromJSON(toJSON(req_raw))
# content(req)
#headers(req)$date

# req_raw <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
req_raw <- with_config(gtoken, GET("https://api.github.com/users/jtleek/repos"))
stop_for_status(req_raw)
results_raw <- content(req_raw)
results_tidy <- fromJSON(toJSON(results_raw))
print(results_tidy)




