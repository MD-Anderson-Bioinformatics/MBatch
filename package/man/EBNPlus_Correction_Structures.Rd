\name{EBNPlus_Correction_Structures}
\alias{EBNPlus_Correction_Structures}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{EBNPlus_Correction_Structures}
\description{
Take two matrices and correct them into a single data set using
the EBNPlus algorithm.
}
\usage{
EBNPlus_Correction_Structures(theDataMatrix1, theDataMatrix2,
theBatchId1, theBatchId2,
theEBNP_BatchWithZero, theEBNP_FixDataSet, theEBNP_CorrectForZero,
theEBNP_ParametricPriorsFlag,
theSeed = NULL, theEBNP_PriorPlotsFile=NULL, theEBNP_MinSampleNum = 3,
theEBNP_AddData1Rows = FALSE, theEBNP_AddData2Rows = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{theDataMatrix1}{A matrix for data set 1 containing numeric values with
  columns being sample ids and rows being gene ids.}
  \item{theDataMatrix2}{A matrix for data set 2 containing numeric values with
  columns being sample ids and rows being gene ids.}
  \item{theBatchId1}{The group name for data set 1 (for example, RNASeqV2)}
  \item{theBatchId2}{The group name for data set 2 (for example, Agilent4502)}
  \item{theEBNP_BatchWithZero}{Batch With Zero indicates which data set
  contains zero values. This is a string "1", "2", or "both".
  These values will be changed in a future release.}
  \item{theEBNP_FixDataSet}{Fix Data Set indicates which data set should
  be set as invariate during the corrections. Value are numeric, 1 or 2 for
  the appropriate data set, or as.numeric(NA) for neither.}
  \item{theEBNP_CorrectForZero}{Correct For Zero indicates whether
  or not data sets
  marked as "Batch With Zero" should be modified from zero (TRUE or FALSE)}
  \item{theEBNP_ParametricPriorsFlag}{Use parametric adjustments
  for corrections (TRUE or FALSE)}
  \item{theSeed}{NULL or a seed to use. Defaults to NULL.
  This is passed to the standard R set.seed function.}
  \item{theEBNP_PriorPlotsFile}{Defaults to NULL and does not create PNG.
  Non-NULL should be the full path and filename for where
  to create the prior plots PNG.}
  \item{theEBNP_MinSampleNum}{Defaults to 3. Any row (gene) with less than
  this number of samples is dropped.}
  \item{theEBNP_AddData1Rows}{Defaults to FALSE. TRUE indicates rows in data
  set 2 not in 1 should be added as all NA.}
  \item{theEBNP_AddData2Rows}{Defaults to FALSE. TRUE indicates rows in data
  set 1 not in 2 should be added as all NA.}
}
\details{
Take two matrices and correct them into a single data set using the EBNPlus
algorithm and the provided arguments, using all replicates for training.
}
\value{
BeaEBNplusFiles returns a matrix. The columns of the matrix are the
barcodes with "." and the group name attached to the barcodes. This extra
string is attached, since the correction algorithm requires replicates,
some barcode will be identical, so some method preserve distinctness is needed.
The row names are gene symbols.
}
\references{}
\author{}
\note{}
\seealso{}
\examples{}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
