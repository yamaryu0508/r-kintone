# M2M2kintone@Koubachi plant sensor
#
# R --vanilla --slave < koubachi.R
#
# parse Koubachi-XML
library(RCurl)
library(rjson)
url <- "http://api.koubachi.com/v2/user/smart_devices/"
macAddress <- "your MAC address"
appKey <- "your app-key"
userCredentials <- "your user-credentials"
url <- paste(url, macAddress, sep="")
url <- paste(url, appKey, sep=".json?app_key=")
url <- paste(url, userCredentials, sep="&user_credentials=")
response <- getURL(url, customrequest="GET")
doc <- fromJSON(response)
tempC <- doc$device$recent_temperature_reading_value
tempC <- substr(tempC,0, length(unlist(strsplit(tempC,"")))-3)
moisture <- doc$device$recent_soilmoisture_reading_value
moisture <- substr(moisture,0, length(unlist(strsplit(moisture,"")))-2)
light <- doc$device$recent_light_reading_value
light <- substr(light,0, length(unlist(strsplit(light,"")))-3)
# access to kintone
library(kintone) # import library "kintone"
kintone <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object
app <- 155 # application ID
record <- c(list("time"=list("value"=doc$device$last_transmission)),  
                   list("tempC"=list("value"=tempC)),  
                   list("humidity"=list("value"=moisture)),  
                   list("light"=list("value"=light))  
                  ) # record (kintone-like R-vector)
kintone@registRecord(app, record) # request with no options