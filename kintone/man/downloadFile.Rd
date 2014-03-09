\name{downloadFile}
\alias{downloadFile}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
download a file
}
\description{
download a file from kintone with HTTPS GET method.
}
%\usage{
%downloadFile(fileName)
%}
%- maybe also 'usage' for other objects documented here.
\section{Methods}{
\describe{

\item{\code{downloadfile(fileKey, fileName)}}{
%%  ~~describe this method here~~
}
}}
\arguments{
  \item{fileKey}{
     file key to be downloaded [required]
}
  \item{fileName}{
     file name to be downloaded [optional(default file name is "kintone.txt")]
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
(NOTE) can download text files only in this method now.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
\item{empty list}{empty object (R-list)}
}
\references{
%% ~put references to the literature/web site here ~
Cybozu official page \url{http://developers.kintone.com/kintone-apis/app-apis/file-download.html}
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
\code{\link{uploadFile}}
}
\examples{
################################################################
#
#  Download a file
#
################################################################

kintone <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object 
    fileKey <- "87115c38-908e-40ea-b10b-fe8a26698b55" # file key
    kintone@downloadFile(fileKey)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
