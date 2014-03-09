.getRecord <- function(.Object, app, id, spaceId){
    params <- .getParams(.Object, "record", spaceId)
    #print(params)
    url <- paste(params[["url"]], "?app=", app, "&id=", id, sep="")
    contents <- paste('{}')
    responseJson <- getURL(url, customrequest="GET", postfields=contents, httpheader=params[["headers"]], ssl.verifypeer = FALSE)
    #print(responseJson)
    response <- fromJSON(responseJson)
    return(response)
}

.getRecords <- function(.Object, app, spaceId, query, fields){
    if(missing(query)){
        .query <-""
    }else{
        .query <- URLencode(query)
    }
    if(missing(fields)){
        .fields <- ""
    }else{
        .fields <- ""
        for(i in 1:length(fields)){
            .fields <- paste(.fields, "&fields",URLencode("["), i-1, URLencode("]"), "=", fields[[i]], sep="")
        }
    }
    params <- .getParams(.Object, "records", spaceId)
    #print(params)
    url <- paste(params[["url"]], "?app=", app, "&query=", .query, .fields, sep="")
    #print(url)
    contents <- paste('{}')
    responseJson <- getURL(url, customrequest="GET", postfields=contents, httpheader=params[["headers"]], ssl.verifypeer = FALSE)
    #print(responseJson)
    response <- fromJSON(responseJson)
    return(response)
}

.getForm <- function(.Object, app, spaceId){
    params <- .getParams(.Object, "form", spaceId)
    #print(params)
    url <- paste(params[["url"]], "?app=", app, sep="")
    contents <- paste('{}')
    responseJson <- getURL(url, customrequest="GET", postfields=contents, httpheader=params[["headers"]], ssl.verifypeer = FALSE)
    #print(responseJson)
    response <- fromJSON(responseJson)
    return(response)
}
