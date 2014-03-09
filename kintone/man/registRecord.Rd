\name{registRecord}
\alias{registRecord}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
regist a single record
}
\description{
regist a single record to kintone with HTTPS POST method.
}
%\usage{
%registRecord(app, record, spaceId=spaceId)
%}
%- maybe also 'usage' for other objects documented here.
\section{Methods}{
\describe{

\item{\code{registRecord(app, id, spaceId = spaceId)}}{
%%  ~~describe this method here~~
}
}}
\arguments{
  \item{app}{
     application ID [required]
}
  \item{record}{
     record object [required]
}
  \item{spaceId}{
     space ID [optional/cannot omit while accessing to guest space]
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
\item{record number list}{record number to be registed (R-list)}
}
\references{
%% ~put references to the literature/web site here ~
Cybozu official page \url{http://developers.kintone.com/kintone-apis/app-apis/record-register-api.html#Record_Register_API}
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
\code{\link{registRecords}}
}
\examples{
################################################################
#
#  Regist a single record
#
################################################################

kintone <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object 
    app <- 113 # application ID
    record <- c(list("lat"=list("value"=31.7401)),  
                list("lon"=list("value"=130.7536))  
               ) # record (kintone-like R-vector)
    kintone@registRecord(app, record)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
