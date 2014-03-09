\name{getRecord}
\alias{getRecord}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
single record retrieval
}
\description{
retrieve a single record from kintone with HTTPS GET method.
}
%\usage{
%getRecord(app, id, spaceId=spaceId)
%}
%- maybe also 'usage' for other objects documented here.
\section{Methods}{
\describe{

\item{\code{getRecord(app, id, spaceId = spaceId)}}{
%%  ~~describe this method here~~
}
}}
\arguments{
  \item{app}{
     application ID [required]
}
  \item{id}{
     record ID [required]
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
\item{record}{record object (R-list)}
}
\references{
%% ~put references to the literature/web site here ~
Cybozu official page \url{http://developers.kintone.com/kintone-apis/app-apis/record-retrieval-api.html#Assign_by_Record_Number}
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
\code{\link{getRecords}}
}
\examples{
################################################################
#
#  Retrieve single record
#
################################################################

kintone <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object 
    app <- 7 # application ID
    id <- 7 # record ID
    kintone@getRecord(app, id)

################################################################
#
#  Retrieve single record from guest space
#
################################################################

kintone <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object
    app <- 220 # application ID
    id <- 7 # record ID
    spaceId <- 2 # space ID
    kintone@getRecord(app, id, spaceId=spaceId)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
