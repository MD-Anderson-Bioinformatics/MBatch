#MBatch Copyright ? 2011, 2012, 2013, 2014, 2015, 2016, 2017 University of Texas MD Anderson Cancer Center
#
#This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 2 of the License, or (at your option) any later version.
#
#This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.

library(MBatch)

inputDir <- getTestInputDir()
outputDir <- getTestOutputDir()
compareDir <- getTestCompareDir()

theGeneFile=file.path(inputDir, "matrix_data-Tumor.tsv")
theBatchFile=file.path(inputDir, "batches-Tumor.tsv")
theOutputDir=file.path(outputDir, "MP_Overall")
theCompareFile=file.path(compareDir, "MP_Overall.tsv")
theRandomSeed=314
#myRandomSeed <- 314
#myTestSeed <- 42
theBatchType="TSS"


if (!is.null(inputDir))
{
  warnLevel<-getOption("warn")
  on.exit(options(warn=warnLevel))
  # warnings are errors
  options(warn=3)
  # if there is a warning, show the calls leading up to it
  options(showWarnCalls=TRUE)
  # if there is an error, show the calls leading up to it
  options(showErrorCalls=TRUE)
  #
  unlink(theOutputDir, recursive=TRUE)
  dir.create(theOutputDir, showWarnings=FALSE, recursive=TRUE)
  # load data
  myData <- mbatchLoadFiles(theGeneFile, theBatchFile)
  myData@mData <- mbatchTrimData(myData@mData, 100000)
  # here, we take all the defaults to hierarchical clustering, passing a title and an output path
  MP_Overall(theBeaData=myData,
             thePath=theOutputDir,
             theWriteToFile=TRUE)
  correctedMatrix <- readAsGenericMatrix(file.path(theOutputDir, "ANY_Corrections-MPOverall.tsv"))
  compareMatrix <- readAsGenericMatrix(theCompareFile)
  compared <- compareTwoMatrices(correctedMatrix, compareMatrix)
  print(compared)
  compared
} else {
  message("No test data. Skip test.")
  TRUE
}
