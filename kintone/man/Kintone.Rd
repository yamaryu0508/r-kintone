\name{Kintone}
\alias{Kintone}
\alias{kintone-class}
\alias{initialize,kintone-method}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{initialize/declare kintone object for R
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
initialize/declare kintone object for R
}
\usage{
Kintone(domain, id, passWord, basicId, basicPassWord)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{domain}{
cybozu.com domain [required]
}
  \item{id}{
user ID for cybozu.com [required]
}
  \item{passWord}{
%%     ~~Describe \code{passWord} here~~
password for cybozu.com [required]
}
  \item{basicId}{
user ID (basic authentication) for cybozu.com [optional]
}
  \item{basicPassWord}{
%%     ~~Describe \code{basicPassWord} here~~
password (basic authentication) for cybozu.com [optional]
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
\item{Kintone object}{kintone object}
}
%\references{
%% ~put references to the literature/web site here ~
%}
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
%kintone
%}
\examples{
kintone <- Kintone("hakata.cybozu.com", "r-kintone", "r-kintone") # declare Kintone object
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
