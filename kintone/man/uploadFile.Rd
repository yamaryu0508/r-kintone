\name{uploadFile}
\alias{uploadFile}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
upload a file
}
\description{
upload a file to kintone with HTTPS POST method.
}
%\usage{
%uploadFile(fileName)
%}
%- maybe also 'usage' for other objects documented here.
\section{Methods}{
\describe{

\item{\code{uploadfile(fileName)}}{
%%  ~~describe this method here~~
}
}}
\arguments{
  \item{fileName}{
     file name to be uploaded [required]
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%detail in Kintone.rd
%}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
\item{fileKey}{file key to be used for binding to kintone filed}
}
\references{
%% ~put references to the literature/web site here ~
Cybozu official page \url{http://developers.kintone.com/kintone-apis/app-apis/file-upload.html}
}
\author{
%%  ~~who you are~~
Ryu Yamashita
}
%\note{
%%  ~~further notes~~
%note in Kintone.rd
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link{downloadFile}}, \code{\link{registRecord}}, \code{\link{registRecords}}, \code{\link{updateRecord}}, \code{\link{updateRecords}}
}
\examples{
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

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
