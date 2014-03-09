# R --vanilla --slave < corSmartPlot.R
# retrieve data from kintone
library(kintone) # import library "kintone"
kintone <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object
app <- 283 # application ID
res <- kintone@getRecords(app, query='offset 500') # request with no options
temp_data <- as.numeric(lapply(res$records, function(x){x$気温$value})) # sampling temperature data
pyrano_data <- as.numeric(lapply(res$records, function(x){x$傾斜面日射強度$value})) # sampling pyrano-meter data
dcPower_data <- unlist(as.numeric(lapply(res$records, function(x){x$パワーコンディショナ出力$value}))) # sampling DC Power data
acPower_data <- as.numeric(lapply(res$records, function(x){x$太陽電池出力$value})) # sampling AC Power data
dataFrame <- data.frame(temp_data, pyrano_data, dcPower_data, acPower_data)
#
# functions for plot expression
lowerf <- function(x, y){
    points(x, y, col ="blue")
    abline(lm(y ~ x), col = "red")
}
 
upperf <- function(x, y){
    loc <- complex(, mean(range(x)), mean(range(y)))
    r <- round(cor(x, y), 3)
    if(r>=0.8)
        textColor <- "green"
    else {if(r>=0.5)
        textColor <- "blue"
    else
        textColor <- "red"}
    coff <- lm(x~y)
    r1 <- round(coff$coefficients[2], 2)
    text(loc, lab=r, pos=1, col=textColor, cex=1.6)
    text(loc, lab=r1, pos=3, col="black", cex=1.6)
}

diagf <- function(x,pch=1,bg=1, ...){
    usr <- par("usr"); on.exit(par(usr))
    par(usr = c(usr[1:2], 0, 1.5) )
    h <- hist(x, plot = FALSE)
    breaks <- h$breaks; nB <- length(breaks)
    y <- h$counts; y <- y/max(y)
    rect(breaks[-nB], 0, breaks[-1], y, col = "#0000ff40", border = "#0000ff", ...)
}
#
pairs(dataFrame , lower.panel=lowerf, upper.panel=upperf, diag.panel=diagf) # plot relation among pyrano-meter and DC/AC output Power in PV systems

