.getParams <- function(.Object, command, spaceId){
    if(missing(spaceId)){
        url <- paste("https://", .Object@domain, .Object@appPath, .Object@apiVersion, "/",  command, ".json", sep="")
    }else{
        url <- paste("https://", .Object@domain, .Object@appPath, "guest/", spaceId, "/", .Object@apiVersion, "/", command, ".json", sep="")
    }

    if(command == "file"){
        headers <- c('X-Cybozu-Authorization' = .Object@authToken, 'Authorization'=as.character(paste("basic", .Object@basicAuthToken, sep=" ")), verbose = TRUE)
    }else{
        headers <- c('X-Cybozu-Authorization' = .Object@authToken, 'Authorization'=as.character(paste("basic", .Object@basicAuthToken, sep=" ")), 'Content-Type'="application/json", verbose = TRUE)
    }

    return(list("url"=url, "headers"= headers))
}