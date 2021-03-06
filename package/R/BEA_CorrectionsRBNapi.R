#MBatch Copyright ? 2011, 2012, 2013, 2014, 2015, 2016, 2017 University of Texas MD Anderson Cancer Center
#
#This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 2 of the License, or (at your option) any later version.
#
#This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.

RBN_internal <- function(theInvariantMatrix, theVariantMatrix,
                         theInvariantReplicates, theVariantReplicates,
                         theInvariantGroupId, theVariantGroupId,
                         theMatchedReplicatesFlag,
                         thePath,
                         theWriteToFile,
                         theRBNType,
                         theCombineOnlyFlag)
{
  logDebug("please note: internally, RBN processes transposed the data, output (file and matrix) match the submitted data with samples across columns and features down the rows")
  logInfo("RBN_internal - starting")
  getMBatchVersion()
  results <- NULL
  myPath <- thePath
  if (TRUE==theWriteToFile)
  {
    checkCreateDir(myPath)
  }
  results <- BeaRBN(t(theInvariantMatrix), t(theVariantMatrix),
                    theInvariantReplicates, theVariantReplicates,
                    invGroupID = theInvariantGroupId,
                    varGroupID = theVariantGroupId,
                    matchedReplicates = theMatchedReplicatesFlag,
                    theCombineOnlyFlag = theCombineOnlyFlag)
  correctFile <- NULL
  if ((!is.null(results))&&(TRUE==theWriteToFile))
  {
    correctFile <- file.path(myPath, paste("ANY_Corrections-", theRBNType, ".tsv", sep=""))
    writeDataToFile(results, correctFile)
    results <- correctFile
  }
  else if (TRUE==theWriteToFile)
  {
    logInfo("RBN_internal - no corrections, delete thePath ", myPath)
    unlink(myPath, recursive=TRUE)
  }
  logInfo("RBN_internal - completed")
  return(results)
}

RBN_Replicates <- function(theInvariantMatrix, theVariantMatrix,
                           theInvariantGroupId="", theVariantGroupId="",
                           theMatchedReplicatesFlag=TRUE,
                           theCombineOnlyFlag=FALSE,
                           thePath=NULL,
                           theWriteToFile=FALSE)
{
  invariantReplicates <- getReplicatesForRBN(theInvariantMatrix, theVariantMatrix)
  variantReplicates <- invariantReplicates
  RBN_internal(theInvariantMatrix=theInvariantMatrix,
               theVariantMatrix=theVariantMatrix,
               theInvariantReplicates=invariantReplicates,
               theVariantReplicates=variantReplicates,
               theInvariantGroupId=theInvariantGroupId,
               theVariantGroupId=theVariantGroupId,
               theMatchedReplicatesFlag=theMatchedReplicatesFlag,
               thePath=thePath,
               theWriteToFile=theWriteToFile,
               theRBNType="RBN_Replicates",
               theCombineOnlyFlag=theCombineOnlyFlag)
}

RBN_Pseudoreplicates <- function(theInvariantMatrix, theVariantMatrix,
                                 theInvariantReplicates, theVariantReplicates,
                                 theInvariantGroupId="", theVariantGroupId="",
                                 theMatchedReplicatesFlag=TRUE,
                                 theCombineOnlyFlag=FALSE,
                                 thePath=NULL,
                                 theWriteToFile=FALSE)
{
  RBN_internal(theInvariantMatrix=theInvariantMatrix,
               theVariantMatrix=theVariantMatrix,
               theInvariantReplicates=theInvariantReplicates,
               theVariantReplicates=theVariantReplicates,
               theInvariantGroupId=theInvariantGroupId,
               theVariantGroupId=theVariantGroupId,
               theMatchedReplicatesFlag=theMatchedReplicatesFlag,
               thePath=thePath,
               theWriteToFile=theWriteToFile,
               theRBNType="RBN_Pseudoreps",
               theCombineOnlyFlag=theCombineOnlyFlag)
}


getReplicatesForRBN <- function(matrix1, matrix2)
{
  return( colnames( matrix1[ ,colnames(matrix1) %in% colnames(matrix2) ] ) )
}
