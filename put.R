.updateRecord <- function(.Object, app, id, record, spaceId){
    params <- .getParams(.Object, "record", spaceId)
    #print(params)
    url <- paste(params[["url"]], sep="")
    request <- list("app" = app, "id" = id, "record" = record)
    requestJson <- toJSON(request)
    contents <- paste(requestJson)
    responseJson <- getURL(url, customrequest="PUT", postfields=contents, httpheader=params[["headers"]], ssl.verifypeer = FALSE)
    #print(responseJson)
    response <- fromJSON(responseJson)
    return(response)
}

.updateRecords <- function(.Object, app, records, spaceId){
    params <- .getParams(.Object, "records", spaceId)
    #print(params)
    url <- paste(params[["url"]], sep="")
    request <- list("app" = app, "records" = records)
    requestJson <- toJSON(request)
    contents <- paste(requestJson)
    responseJson <- getURL(url, customrequest="PUT", postfields=contents, httpheader=params[["headers"]], ssl.verifypeer = FALSE)
    #print(responseJson)
    response <- fromJSON(responseJson)
    return(response)
}