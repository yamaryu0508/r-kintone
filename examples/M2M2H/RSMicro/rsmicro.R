# M2M2kintone@RSMicro(GEIST) temperature and humidity sensor
#
# R --vanilla --slave < rsmicro.R
#
# parse RSMicro-XML
library(RCurl)
library(XML)
url <-"http://76.79.48.112" # demo address
url <- paste(url, "/data.xml", sep="")
response <- getURL(url, customrequest="GET")
doc <- xmlRoot(xmlTreeParse(response))
field <- getNodeSet(doc, "//field") # retreive "field" element
value <- sapply(field, function(x) xmlGetAttr(x, "value")) # retreive values from RSMicro
# access to kintone
library(kintone) # import library "kintone"
kintone <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object
app <- 155 # application ID
record <- c(list("tempC"=list("value"=value[1])),  
                   list("humidity"=list("value"=value[2])),  
                   list("dew"=list("value"=value[3]))  
                  ) # record (kintone-like R-vector)
kintone@registRecord(app, record) # request with no options