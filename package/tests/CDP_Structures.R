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

theGeneFile1=file.path(inputDir, "CDP_reuserep_data1.tsv")
theGeneFile2=file.path(inputDir, "CDP_reuserep_data2.tsv")
theOutputDir=file.path(outputDir, "CDP_Structures")
theRandomSeed=314

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
  unlink(theOutputDir, recursive=TRUE, force=TRUE)
  dir.create(theOutputDir, showWarnings=FALSE, recursive=TRUE)
  # load data
  theData1 <- readAsGenericMatrix(theGeneFile1)
  theData2 <- readAsGenericMatrix(theGeneFile2)
  ##############################################################################
  theUseReplicatesUnpaired <- FALSE
  theUnmatchedCount <- 1000
  CDP_Structures(file.path(theOutputDir, "CDP_Plot.png"), theData1, theData2,
            theSubTitle="reuse replicates", theMethod="pearson", theUse="pairwise.complete.obs", theSeed=theRandomSeed,
            theLinePlot=TRUE, theHistPlot=TRUE, theBinWidth=NULL, theUseReplicatesUnpaired=TRUE)
  message("No error means test was OK.")
  TRUE
} else {
  message("No test data. Skip test.")
  TRUE
}
