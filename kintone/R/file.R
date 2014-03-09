.uploadFile <- function(.Object, fileName){
    params <- .getParams(.Object, "file")
    #print(params)
    url <- paste(params[["url"]], sep="")
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
