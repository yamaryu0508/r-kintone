.uploadFile <- function(.Object, fileName){
    params <- .getParams(.Object, "file")
    #print(params)
    url <- paste(params[["url"]], sep="")
    #check login
    contents <- paste('{}')
    checkJson <- getURL(url, customrequest="GET", postfields=contents, httpheader=params[["headers"]], ssl.verifypeer = FALSE)
    check <- fromJSON(checkJson)
    if(check$code=="CB_AU01"){
        message <- list(message=check$message)
        return(message)
    }
    #upload file
    responseJson<-postForm(url,
         file = fileUpload(filename = fileName,
                    contentType = "multipart/form-data"),
                    .opts = list(httpheader = params[["headers"]], 
ssl.verifypeer = FALSE, verbose = TRUE)
    )
    response <- fromJSON(responseJson)
    return(response)
}

.downloadFile <- function(.Object, fileKey, fileName){
    params <- .getParams(.Object, "file")
    #print(params)
    url <- paste(params[["url"]], "?fileKey=", fileKey, sep="")
    file <- getURL(url, customrequest="GET", httpheader=params[["headers"]], ssl.verifypeer = FALSE)
    if(missing(fileName)){
        write(file, file="kintone.txt")
    }else{
        write(file, file=fileName)
    }
}
