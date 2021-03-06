\name{MP_Overall}
\alias{MP_Overall}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{MP_Overall}
\description{
Perform Median Polish Overall Corrections
}
\usage{
MP_Overall(theBeaData, thePath = NULL, theWriteToFile = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{theBeaData}{An instance of BEA_DATA \code{\link{BEA_DATA-class}}}
  \item{thePath}{Output path for any files.}
  \item{theWriteToFile}{TRUE to write the corrected data to file and return
  the file pathname instead of the corrected matrix.}
}
\details{
Perform Median Polish correction overall.
Returning the corrected matrix or a path to the filename.
}
\value{
Return the corrected matrix (columns are sample ids and rows are features)
or a path to the filename.
}
\references{}
\author{}
\note{}
\seealso{}
\examples{}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
