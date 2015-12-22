# 1. Merges the training and the test sets to create one data set.

trainData <- read.table("./train/X_train.txt")
dim(trainData) 
trainLabel <- read.table("./train/y_train.txt")
table(trainLabel)
trainSubject <- read.table("./train/subject_train.txt")

testData <- read.table("./test/X_test.txt")
dim(testData) 
testLabel <- read.table("./test/y_test.txt") 
table(testLabel) 
testSubject <- read.table("./test/subject_test.txt")

mergeData <- rbind(trainData, testData)
dim(mergeData)
mergeLabel <- rbind(trainLabel, testLabel)
dim(mergeLabel)
mergeSubject <- rbind(trainSubject, testSubject)
dim(mergeSubject) 

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("./features.txt")
dim(features) 
indices <- grep("\\-mean\\(\\)|\\-std\\(\\)", features[, 2])
length(indices) 
mergeData <- mergeData[, indices]
dim(mergeData) 

names(mergeData) <- gsub("\\(\\)", "", features[indices, 2]) 
names(mergeData) <- gsub("-", "", names(mergeData))
names(mergeData) <- gsub("mean", "Mean", names(mergeData)) 
names(mergeData) <- gsub("std", "Std", names(mergeData))


# 3. Uses descriptive activity names to name the activities in the data set
activity <- read.table("./activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))

substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))

activityLabel <- activity[mergeLabel[, 1], 2]
mergeLabel[, 1] <- activityLabel
names(mergeLabel) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names. 
names(mergeSubject) <- "subject"
tidyData <- cbind(mergeSubject, mergeLabel, mergeData)
dim(tidyData)
#write.table(tidyData, "merged_data.txt")

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

library(dplyr)

by_subject_activity <- group_by(tidyData, subject, activity)

newTidyData <- summarise_each(by_subject_activity, funs(mean))

write.table(newTidyData, "tidy_data.txt", row.names = FALSE)



