.deleteRecords <- function(.Object, app, ids, spaceId){
    params <- .getParams(.Object, "records", spaceId)
    #print(params)
    url <- paste(params[["url"]], sep="")
    #print(url)
    request <- list("app" = app, "ids" = ids)
    requestJson <- toJSON(request)
    contents <- paste(requestJson)
    responseJson <- getURL(url, customrequest="DELETE", postfields=contents, httpheader=params[["headers"]], ssl.verifypeer = FALSE)
    #print(responseJson)
    response <- fromJSON(responseJson)
    return(response)
}
