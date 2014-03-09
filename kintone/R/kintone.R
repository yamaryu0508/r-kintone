library(RCurl)
library(rjson)

#source("params.R")
#source("get.R")
#source("post.R")
#source("put.R")
#source("delete.R")
#source("file.R")

setClass(
    "kintone",
    representation(
        domain = "character",
        id = "character",
        passWord = "character",
        basicId = "character",
        basicPassWord = "character",
        authToken = "character",
        basicAuthToken = "character",
        appPath = "character",
        apiVersion = "character",
        getParams = "function",
        getRecord = "function",
        getRecords = "function",
        getForm = "function",
        registRecord = "function",
        registRecords = "function",
        updateRecord = "function",
        updateRecords = "function",
        deleteRecords = "function",
        uploadFile = "function",
        downloadFile = "function"
    ),
    prototype(
        domain = "cybozu.com domain",
        id = "id",
        passWord = "passWord",
        basicId = "",
        basicPassWord = "",
        authToken = "",
        basicAuthToken = "",
        appPath = "/k/",
        apiVersion = "v1"
    )
)

setMethod("initialize",
    signature = "kintone",
    definition = function(.Object, domain, id, passWord, basicId, basicPassWord){
        if(missing(basicId) || missing(passWord)){
            .Object@domain <- domain
            .Object@authToken <- as.character(base64(paste(id, passWord, sep=":")))
        }else{
            .Object@domain <- domain
            .Object@authToken <- as.character(base64(paste(id, passWord, sep=":")))
            .Object@basicAuthToken <- as.character(base64(paste(basicId, basicPassWord, sep=":")))
        }
        
        .Object@getParams <- function(command, spaceId){
            .getParams(.Object, command, spaceId)
        }
        .Object@getRecord <- function(app, id, spaceId){
            .getRecord(.Object, app, id, spaceId)
        }
        .Object@getRecords <- function(app, spaceId, query, fields){
            .getRecords(.Object, app, spaceId, query, fields)
        }
        .Object@getForm <- function(app, spaceId){
            .getForm(.Object, app, spaceId)
        }
        .Object@registRecord <- function(app, record, spaceId){
            .registRecord(.Object, app, record, spaceId)
        }
        .Object@registRecords <- function(app, records, spaceId){
            .registRecords(.Object, app, records, spaceId)
        }
        .Object@updateRecord <- function(app, id, record, spaceId){
            .updateRecord(.Object, app, id, record, spaceId)
        }
        .Object@updateRecords <- function(app, records, spaceId){
            .updateRecords(.Object, app, records, spaceId)
        }
        .Object@deleteRecords <- function(app, ids, spaceId){
            .deleteRecords(.Object, app, ids, spaceId)
        }
        .Object@uploadFile <- function(fileName){
            .uploadFile(.Object, fileName)
        }
        .Object@downloadFile <- function(fileKey, fileName){
            .downloadFile(.Object, fileKey, fileName)
        }
        
    return(.Object)
    }
)

Kintone <- function(domain, id, passWord, basicId, basicPassWord){
    if(missing(basicId) || missing(passWord)){
        new("kintone", domain, id, passWord)
    }else{
        new("kintone", domain, id, passWord, basicId, basicPassWord)
    }
}