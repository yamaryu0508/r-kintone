\name{getRecords}
\alias{getRecords}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
several records retrieval
}
\description{
retrieve several records from kintone with HTTPS GET method.
}
%\usage{
%getRecords(app, query=query, fields=fields, spaceId=spaceId)
%}
%- maybe also 'usage' for other objects documented here.
%- maybe also 'usage' for other objects documented here.
\section{Methods}{
\describe{

\item{\code{getRecords(app, spaceId = spaceId, query = query, fields = fields)}}{
%%  ~~describe this method here~~
}
}}
\arguments{
  \item{app}{
     application ID [required]
}
  \item{query}{
     query [optional]
}
  \item{fields}{
     fields [optional]
}
  \item{spaceId}{
     space ID for accessing to guest spaces [optional/cannot omit while accessing to guest space]
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
\item{records}{records object (R-list)}
}
\references{
%% ~put references to the literature/web site here ~
Cybozu official page \url{http://developers.kintone.com/kintone-apis/app-apis/record-retrieval-api.html#Assign_by_Conditions_by_Query_Strings}
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
\code{\link{getRecord}}
}
\examples{
################################################################
#
#  Retrieve several records
#
################################################################

kintone <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object
    app <- 113 # application ID
    kintone@getRecords(app) # request with no options

    query <- ' createDay > "2014-02-28" and createDay < "2014-03-02" ' # query strings
    kintone@getRecords(app, query=query) # request with "query" option

    fields <- list("createDay", "lat", "lon") # fields list (R-list)
    kintone@getRecords(app, fields=fields) # request with "fields" option

    kintone@getRecords(app, query=query, fields=fields) # request with "query" and "fields" options

################################################################
#
#  Retrieve several records from guest space
#   (NOTE) allowed to set "query" and/or "fields" options
#
################################################################

kintone1 <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object
    app <- 220 # application ID
    spaceId <- 2 # space ID
    kintone1@getRecords(app, spaceId=spaceId)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
