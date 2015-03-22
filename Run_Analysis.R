setwd("C:/Users/Administrator/Desktop/Coursera")
if(!file.exists("./Project - Cleaning Data")){dir.create("./Project - Cleaning Data")}
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile="./Project - Cleaning Data/Dataset.zip")
unzip(zipfile="./Project - Cleaning Data/Dataset.zip",exdir="./Project - Cleaning Data")
path_rf <- file.path("./Project - Cleaning Data" , "UCI HAR Dataset")
dataActivityTest  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
dataActivityTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)
dataSubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
dataSubjectTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)
dataFeaturesTest  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
dataFeaturesTrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)
### Uses descriptive activity names to name the activities in the data set
names(dataSubject)<- "subject"
names(dataActivity)<- "activity"
dataFeaturesNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2
### 1. Merges the training and the test sets to create one data set.
dataCombine <- cbind(dataSubject, dataActivity, dataFeatures)
### 2.Extracts only the measurements on the mean and standard deviation for each measurement
subdataFeaturesNames <- dataFeaturesNames$V2
selectNmaes <- c(as.character(dataFeaturesNames$V2), "subject", "activity")
dataCombine <- subset(dataCombine, select=selectNmaes)
### 3. Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)
### 4. Appropriately labels the data set with descriptive variable names
names(dataCombine)<-gsub("^t", "time", names(dataCombine))
names(dataCombine)<-gsub("^f", "frequency", names(dataCombine))
names(dataCombine)<-gsub("Acc", "Accelerometer", names(dataCombine))
names(dataCombine)<-gsub("Gyro", "Gyroscope", names(dataCombine))
names(dataCombine)<-gsub("Mag", "Magnitude", names(dataCombine))
names(dataCombine)<-gsub("BodyBody", "Body", names(dataCombine))
### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
dataCombineSub <- lapply(dataCombine, mean)
write.table(dataCombineSub, file = "tidydata2.txt",row.name=FALSE)
