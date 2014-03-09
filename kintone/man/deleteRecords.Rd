\name{deleteRecords}
\alias{deleteRecords}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
delete several records
}
\description{
delete several records from kintone with HTTPS DELETE method.
}
%\usage{
%deleteRecords(app, records, spaceId=spaceId)
%}
%- maybe also 'usage' for other objects documented here.
\section{Methods}{
\describe{

\item{\code{deleteRecords(app, ids, spaceId=spaceId)}}{
%%  ~~describe this method here~~
}
}}
\arguments{
  \item{app}{
     application ID [required]
}
  \item{ids}{
     ids object [required]
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
\item{empty list}{empty object (R-list)}
}
\references{
%% ~put references to the literature/web site here ~
Cybozu official page \url{http://developers.kintone.com/kintone-apis/app-apis/record-delete-api.html#Batch_Record_Update_API}
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

%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%\code{\link{deleteRecord}}
%}
\examples{
################################################################
#
#  Delete several records
#
################################################################

kintone <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object 
    app <- 113 # application ID
    ids <- list(1240, 1241) # record IDs (R-list)
    kintone@deleteRecords(app, ids)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
