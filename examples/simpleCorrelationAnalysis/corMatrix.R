# R --vanilla --slave < corMatrix.R
library(kintone) # import library "kintone"
kintone <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object
app <- 283 # application ID
res <- kintone@getRecords(app, query='offset 500') # request with no options
temp_data <- as.numeric(lapply(res$records, function(x){x$気温$value})) # sampling temperature data
pyrano_data <- as.numeric(lapply(res$records, function(x){x$傾斜面日射強度$value})) # sampling pyrano-meter data
dcPower_data <- unlist(as.numeric(lapply(res$records, function(x){x$パワーコンディショナ出力$value}))) # sampling DC Power data
acPower_data <- as.numeric(lapply(res$records, function(x){x$太陽電池出力$value})) # sampling AC Power data
dataFrame <- data.frame(temp_data, pyrano_data, dcPower_data, acPower_data)
cor(dataFrame) # correlation matrix among pyrano-meter and DC/AC output Power in PV systems
