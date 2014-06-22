## runanalysis()
## 
## This function takes the UCI HAR dataset, and returns an average of
## average and std dev features broken out by subject and activity.  The
## remaining features are discarded.
##
## This function takes as input the UCI Human Activity Recognition Using
## Smartphones Data Set, described at this website:
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## The script assumes the data has been downloaded to the working
## directory.
##
## writeFirstDataSet - an initial "transient" data set is created. If this
## variable is set to TRUE, this data set will be writen to the current
## directory rather than simply disappearing into the ether
## writeSecondDataSet - write the averages to file?
## formatWide - format as wide data vs narrow data?

run_analysis <- function(writeFirstDataSet = FALSE, writeSecondDataSet = TRUE, formatWide = TRUE) {
  # load required libraries
  library(data.table)
  library(reshape2)
  
  # read in the files
  # general data files
  features <- read.table("./UCI HAR Dataset/features.txt")
  activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
  
  # test data files
  xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
  yTest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
  subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  
  # train data files
  xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
  yTrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
  subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  
  # merge subject ID and activity with data
  testData <- cbind(xTest, subjectTest)
  colnames(testData)[ncol(testData)] <- "subjectID"
  testData <- cbind(testData, yTest)
  colnames(testData)[ncol(testData)] <- "activity"
  
  trainData <- cbind(xTrain, subjectTrain)
  colnames(trainData)[ncol(trainData)] <- "subjectID"
  trainData <- cbind(trainData, yTrain)
  colnames(trainData)[ncol(trainData)] <- "activity"
  
  # join the data into one consolidated data file
  data <- rbind(testData, trainData)
  
  # figure out which features are mean and standard deviation values
  featWanted <- sort(c(grep("mean", features$V2), grep("std", features$V2)))
  
  # add subjectID and activity to the selector
  featWanted <- c(featWanted, ncol(data)-1, ncol(data))
  
  # select for only the mean and std values
  data <- data[,featWanted]
  
  # Use descriptive activity names to name the activities in the data set
  for (i in activityLabels$V1) {
    data$activity <- sub(activityLabels$V1[i], activityLabels$V2[i], data$activity)
  }
  
  # provide descriptive variable names for columns (step 4)
  featWanted <- featWanted[1:(length(featWanted)-2)]
  colnames(data)[1:(ncol(data)-2)] <- make.names(features[featWanted,]$V2)
  
  # the assignment doesn't say what to do with the initial data set that is
  # created.  so that it doesn't simply disappear into the ether, i've included
  # the option of writing it to disk.
  if (writeFirstDataSet){
    write.table(data, "dataset1.txt")
    cat("Wrote first data set to disk as dataset1.txt in current directory.")
  }
  
  data2 <- data.frame()
  
  # create the second data set with an average of each feature broken out by
  # subjectID and activity.
  for (subj in sort(unique(data$subjectID))) {
    for (act in activityLabels$V2) {
      for (i in 1:(ncol(data)-2)) {
        avg <- mean(data[(data$subjectID == subj & data$activity == act),i])
        temp <- data.frame(SubjectID = subj, Activity = act, DataFeature = colnames(data)[i], Average = avg)
        data2 <- rbind(data2, temp)
      }
    }
  }
  
  # for thsoe who think wide data is "tidier"
  if(formatWide){
    data2 <- dcast(data2, SubjectID + DataFeature ~ Activity, value.var="Average")
  }
  
  # write dataset to file (if so desired)
  if(writeSecondDataSet){
    write.table(data2, "AverageOfFeatures.txt")
    cat("Wrote first data set to disk as AverageOfFeatures.txt in current directory.")
  }
  
  data2
}