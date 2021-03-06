\name{EB_withNonParametricPriors}
\alias{EB_withNonParametricPriors}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{EB_withNonParametricPriors}
\description{
Perform Empirical Bayes without Parametric Priors corrections.
}
\usage{
EB_withNonParametricPriors(theBeaData, theBatchIdsNotToCorrect,
theDoCheckPlotsFlag, theBatchType, theThreads = 1, thePath = NULL,
theWriteToFile = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{theBeaData}{An instance of BEA_DATA \code{\link{BEA_DATA-class}}}
  \item{theBatchIdsNotToCorrect}{A vector of strings giving batch names/ids
  within the batch type that should not be corrected}
  \item{theDoCheckPlotsFlag}{Defaults to FALSE. TRUE indicates a prior
  plots image should be created.}
  \item{theBatchType}{A string identifying the batch type to correct.}
  \item{theThreads}{Integer defaulting to 1. Number of threads to use
  for calculating priors.}
  \item{thePath}{Output path for any files.}
  \item{theWriteToFile}{TRUE to write the corrected data to file and return
  the file pathname instead of the corrected matrix.}
}
\details{
Perform Empirical Bayes correction with NONParametric Priors.
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
