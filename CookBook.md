Getting and Cleaning Data Course Project CodeBook
=================================================
This code book describes the variables, the data, and any transformations or work that I have performed to clean up the data.  

* Raw data 

The site where the data was obtained:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones   

The data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

* run_analysis.R

 1. Read X_train.txt, y_train.txt and subject_train.txt and store them in *trainData*, *trainLabel* and *trainSubject* variables respectively.  

 2. Read X_test.txt, y_test.txt and subject_test.txt and store them in *testData*, *testLabel* and *testsubject* variables respectively.  

 3. Combine *testData* to *trainData* to get a new data frame *mergeData*; combine *testLabel* to *trainLabel* to get a new data frame *mergeLabel*; combine *testSubject* to *trainSubject* to get a new data frame, *mergeSubject*.  

 4. Read the features.txt and store the data in a variable named *features*. Extract only the measurements on the mean and standard deviation for each measurement. This results the subset of *mergeData* with the 66 columns.  

 5. Remove the "()" and "-" symbols in the column names of *mergeData* and make the column names in the camelCase format.

 6. Read the activity_labels.txt file and store the data in a variable named *activity*.  

 7. Clean the activity names in the second column of *activity* and them in camelCase. 

 8. Transform the values of *mergeLabel* according to the *activity* data frame. 

 9. Combine the *mergeSubject*, *mergeLabel* and *mergeData* by column to get a new data frame, *tidyData*. 

 10. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

 11. Write the tidy data set to "tidy_data.txt" file. 
 
© Yajun Ding 2015 All Rights reserved.
