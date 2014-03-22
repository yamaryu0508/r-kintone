pkgname <- "kintone"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('kintone')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("Kintone")
### * Kintone

flush(stderr()); flush(stdout())

### Name: Kintone
### Title: initialize/declare kintone object for R
### Aliases: Kintone kintone-class initialize,kintone-method

### ** Examples

kintone <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object



cleanEx()
nameEx("deleteRecords")
### * deleteRecords

flush(stderr()); flush(stdout())

### Name: deleteRecords
### Title: delete several records
### Aliases: deleteRecords

### ** Examples

################################################################
#
#  Delete several records
#
################################################################

kintone <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object 
    app <- 113 # application ID
    ids <- list(1240, 1241) # record IDs (R-list)
    kintone@deleteRecords(app, ids)




cleanEx()
nameEx("downloadFile")
### * downloadFile

flush(stderr()); flush(stdout())

### Name: downloadFile
### Title: download a file
### Aliases: downloadFile

### ** Examples

################################################################
#
#  Download a file
#
################################################################

kintone <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object 
    fileKey <- "87115c38-908e-40ea-b10b-fe8a26698b55" # file key
    kintone@downloadFile(fileKey)




cleanEx()
nameEx("getRecord")
### * getRecord

flush(stderr()); flush(stdout())

### Name: getRecord
### Title: single record retrieval
### Aliases: getRecord

### ** Examples

################################################################
#
#  Retrieve single record
#
################################################################

kintone <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object 
    app <- 7 # application ID
    id <- 7 # record ID
    kintone@getRecord(app, id)

################################################################
#
#  Retrieve single record from guest space
#
################################################################

kintone <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object
    app <- 220 # application ID
    id <- 7 # record ID
    spaceId <- 2 # space ID
    kintone@getRecord(app, id, spaceId=spaceId)




cleanEx()
nameEx("getRecords")
### * getRecords

flush(stderr()); flush(stdout())

### Name: getRecords
### Title: several records retrieval
### Aliases: getRecords

### ** Examples

################################################################
#
#  Retrieve several records
#
################################################################

kintone <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object
    app <- 113 # application ID
    kintone@getRecords(app) # request with no options

    query <- ' createDay > "2014-02-28" and createDay < "2014-03-02" ' # query strings
    kintone@getRecords(app, query=query) # request with "query" option

    fields <- list("createDay", "lat", "lon") # fields list (R-list)
    kintone@getRecords(app, fields=fields) # request with "fields" option

    kintone@getRecords(app, query=query, fields=fields) # request with "query" and "fields" options

################################################################
#
#  Retrieve several records from guest space
#   (NOTE) allowed to set "query" and/or "fields" options
#
################################################################

kintone1 <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object
    app <- 220 # application ID
    spaceId <- 2 # space ID
    kintone1@getRecords(app, spaceId=spaceId)




cleanEx()
nameEx("registRecord")
### * registRecord

flush(stderr()); flush(stdout())

### Name: registRecord
### Title: regist a single record
### Aliases: registRecord

### ** Examples

################################################################
#
#  Regist a single record
#
################################################################

kintone <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object 
    app <- 113 # application ID
    record <- c(list("lat"=list("value"=31.7401)),  
                list("lon"=list("value"=130.7536))  
               ) # record (kintone-like R-vector)
    kintone@registRecord(app, record)




cleanEx()
nameEx("registRecords")
### * registRecords

flush(stderr()); flush(stdout())

### Name: registRecords
### Title: regist several records
### Aliases: registRecords

### ** Examples

################################################################
#
#  Regist several records
#
################################################################

kintone <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object 
    app <- 113 # application ID
    records <- list(c(list("lat"=list("value"=31.7401)),  
                      list("lon"=list("value"=130.7536))  
                     ),  
                    c(list("lat"=list("value"=51.7401)),  
                      list("lon"=list("value"=150.7536))  
                     )
                   ) # records (kintone-like R-list)
    kintone@registRecords(app, records)




cleanEx()
nameEx("updateRecord")
### * updateRecord

flush(stderr()); flush(stdout())

### Name: updateRecord
### Title: update a single record
### Aliases: updateRecord

### ** Examples

################################################################
#
#  Update a single record
#
################################################################

kintone <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object 
    app <- 113 # application ID
    id <- 1245 # record ID
    record <- c(list("lat"=list("value"=31.7401)),  
                list("lon"=list("value"=130.7536))
               ) # record (kintone-like R-vector)
    kintone@updateRecord(app, id, record)




cleanEx()
nameEx("updateRecords")
### * updateRecords

flush(stderr()); flush(stdout())

### Name: updateRecords
### Title: update several records
### Aliases: updateRecords

### ** Examples

################################################################
#
#  Update several records
#
################################################################

kintone <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object 
    app <- 113 # application ID
    records <- list(list("id"=1244,  
                         "record"=c(list("lat"=list("value"=31.7401)),  
                                    list("lon"=list("value"=130.7536))  
                                   )  
                        ),  
                    list("id"=1245,  
                         "record"=c(list("lat"=list("value"=51.7401)),  
                                    list("lon"=list("value"=150.7536))
                                   )  
                        )  
                  ) # records (kintone-like R-list)
    kintone@updateRecords(app, records)




cleanEx()
nameEx("uploadFile")
### * uploadFile

flush(stderr()); flush(stdout())

### Name: uploadFile
### Title: upload a file
### Aliases: uploadFile

### ** Examples

################################################################
#
#  Upload a file
#
################################################################
# build text file for upload example
xml <- getURL(url="http://76.79.48.112/data.xml")
write(xml,file="./kintone.xml")
#
# upload a file, "kintone.xml"
kintone <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object 
    fileName <- "./kintone.xml" # file name
    kintone@uploadFile(fileName)




### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
