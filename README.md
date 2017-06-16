# kintone REST API client package for R (unofficial)

This package allows one to compose kintone REST API requests and convenient functions to convert kintone-JSON/R-Objects in R scriptings.

[kintone](https://www.kintone.com/ "English page") is very useful and powerful cloud service provided by [Cybozu, inc.](http://cybozu.co.jp/ "Cybozu, inc.")

**(NOTICE)** This package has not yet been fully tested for bugs.  

## License

BSD_2_clause

## Dependence packages
* RCurl
* rjson

## CRAN package
* manual ([PDF](http://cran.r-project.org/web/packages/kintone/kintone.pdf))
* information ([HTML](http://cran.r-project.org/web/packages/kintone/index.html))

## Installation

`R CMD INSTALL kintone_0.1.tar.gz` in your console on Mac OS X/Linux

or

`install.packages("kintone")` in your R console

## Fundamental usage

You can set parameters with R-format, and get responses with R-format, too.

**(NOTE)** Sample code files are [here](https://github.com/yamaryu0508/r-kintone/tree/master/examples "sample code").

### Initialization

First, you include library "kintone", and access to your "cybozu.com domain" with your "user id" and "user password".

    library(kintone) # load "kintone" package
    kintone <- Kintone("cybozu.com domain", "user id", "user password") # declare Kintone object w/o basic authentication

In case basic authentication is required,
    
    kintone <- Kintone("cybozu.com domain", "user id", "user password", "basic id", "basic password") # declare Kintone object w/ basic authentication

### Record retrieval method

For single record retrieval,

    app <- 7 # application ID
    id <- 7 # record ID
    kintone@getRecord(app, id)

For several records retrieval,

    app <- 113 # application ID
    query <- 'createDay > "2014-02-28" and createDay < "2014-03-02"' # query strings
    fields <- list("createDay", "lat", "lon") # fields list (R-list)
    kintone@getRecords(app, query=query, fields=fields)
    
and you can omit `query` and/or `fields` options as follows.

    kintone@getRecords(app)

### Record register method

For single record registration,

    app <- 113 # application ID
    record <- c(list("lat"=list("value"=31.7401)),  
                list("lon"=list("value"=130.7536))  
               ) # record (kintone-like R-vector)
    kintone@registRecord(app, record)

For several records registration,

    app <- 113 # application ID
    records <- list(c(list("lat"=list("value"=31.7401)),  
                      list("lon"=list("value"=130.7536))  
                     ),  
                    c(list("lat"=list("value"=51.7401)),  
                      list("lon"=list("value"=150.7536))  
                     )
                   ) # records (kintone-like R-list)
    kintone@registRecords(app, records)

### Record update method

For single record update,

    app <- 113 # application ID
    id <- 1245 # record ID
    record <- c(list("lat"=list("value"=31.7401)),  
                list("lon"=list("value"=130.7536))
               ) # record (kintone-like R-vector)
    kintone@updateRecord(app, id, record)

For several records update,

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

### Records delete method

    app <- 113 # application ID
    ids <- list(1240, 1241) # record IDs (R-list)
    kintone@deleteRecords(app, ids)

### File upload method

    fileName <- "README.md" # file name
    kintone@uploadFile(fileName)

### File download method
**(NOTE)** You can download text files only in this method now.  

    fileKey <- "87115c38-908e-40ea-b10b-fe8a26698b55" # file key
    kintone@downloadFile(fileKey)

## Access to guest spaces

You can set a `spaceId` option as follows.

    spaceId <- 5
    # For retreival methods
    kintone@getRecord(app, id, spaceId=spaceId)
    kintone@getRecords(app, query=query, fields=fields, spaceId=spaceId)
    # For regist methods
    kintone@registRecord(app, record, spaceId=spaceId)
    kintone@registRecords(app, records, spaceId=spaceId)
    # For update methods
    kintone@updateRecord(app, id, record, spaceId=spaceId)
    kintone@updateRecords(app, records, spaceId=spaceId)
    # For delete method
    kintone@deleteRecords(app, ids, spaceId=spaceId)
    
## kintone official information

* kintone on cybozu.com [ [English](https://www.kintone.com/ "English page") | [Japanese](https://kintone.cybozu.com/jp/ "Japanese page") ]
* kintone developers [[English](https://developer.kintone.io "English page")]
* cybozu.com developer network [[Japanese](https://cybozudev.zendesk.com/hc/ja/ "Japanese page")]
* Cybozu, inc. [ [English](https://www.kintone.com/build-applications-platform/ "English page") | [Japanese](http://cybozu.co.jp/ "Japanese page") ]
