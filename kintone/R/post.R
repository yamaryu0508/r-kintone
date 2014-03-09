.registRecord <- function(.Object, app, record, spaceId){
    params <- .getParams(.Object, "record", spaceId)
    #print(params)
    url <- paste(params[["url"]], sep="")
    request <- list("app" = app, "record" = record)
    requestJson <- toJSON(request)
    contents <- paste(requestJson)
    responseJson <- getURL(url, customrequest="POST", postfields=contents, httpheader=params[["headers"]], ssl.verifypeer = FALSE)
    #print(responseJson)
    response <- fromJSON(responseJson)
    return(response)
}

.registRecords <- function(.Object, app, records, spaceId){
    params <- .getParams(.Object, "records", spaceId)
    #print(params)
    url <- paste(params[["url"]], sep="")
    request <- list("app" = app, "records" = records)
    requestJson <- toJSON(request)
    contents <- paste(requestJson)
    responseJson <- getURL(url, customrequest="POST", postfields=contents, httpheader=params[["headers"]], ssl.verifypeer = FALSE)
    #print(responseJson)
    response <- fromJSON(responseJson)
    return(response)
}