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

theDataFile1=file.path(inputDir, "brca_rnaseq2_matrix_data.tsv")
theDataFile2=file.path(inputDir, "brca_agi4502_matrix_data.tsv")
theOutputDir=file.path(outputDir, "ebnplus")
theCompareFile=file.path(compareDir, "EBNPlus_Correction_Files.tsv")
theBatchId1="RNASeqV2"
theBatchId2="Agilent4502"
theRandomSeed=314
#myRandomSeed <- 314
#myTestSeed <- 42

if (!is.null(inputDir))
{
  message("EBNPlus_Correction_Files")
  warnLevel<-getOption("warn")
  on.exit(options(warn=warnLevel))
  # warnings are errors
  options(warn=3)
  # if there is a warning, show the calls leading up to it
  options(showWarnCalls=TRUE)
  # if there is an error, show the calls leading up to it
  options(showErrorCalls=TRUE)
  #
  outdir <- file.path(theOutputDir, "EBNPlus_Correction_Files")
  unlink(outdir, recursive=TRUE)
  dir.create(outdir, showWarnings=FALSE, recursive=TRUE)
  #setLogging(new("Logging", theFile=file.path(outdir, "mbatch.log")))
  # this is an MDA function that starts with and processes standardized data files
  myCorrectedFile <- EBNPlus_Correction_Files(
    theDataFile1=theDataFile1,
    theDataFile2=theDataFile2,
    theOutputDir=outdir,
    theBatchId1=theBatchId1,
    theBatchId2=theBatchId2,
    theSeed=theRandomSeed,
    theEBNP_PriorPlotsFlag=TRUE)
  message("after correction-load file")
  myCorrectedFile <- myCorrectedFile[[1]]
  myRenamedFile <- file.path(dirname(myCorrectedFile), "corrected.tsv")
  file.rename(myCorrectedFile, myRenamedFile)
  correctedMatrix <- readAsGenericMatrix(myRenamedFile)
  compareMatrix <- readAsGenericMatrix(theCompareFile)
  message("myRenamedFile=",myRenamedFile)
  message("theCompareFile=",theCompareFile)
  message("correctedMatrix")
  print(dim(correctedMatrix))
  print(correctedMatrix[1:4,1:3])
  message("compareMatrix")
  print(dim(compareMatrix))
  print(compareMatrix[1:4,1:3])
  compared <- compareTwoMatrices(correctedMatrix, compareMatrix)
  print(compared)
  compared
} else {
  message("No test data. Skip test.")
  TRUE
}