## Getting and Cleaning Data Project Assignment

This repository hosts a R code and other supplementary files

### Sketch
The goal of the R code run_analysis is to demonstrate the ability to collect, work with, and clean a given data set, and thereby
prepare a tidy data set for later analysis. 
[The source data for this project is available from](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Instructions
This run_analysis.R script does the following: 
 1) merges the training and the test sets to create one data set,
 2) extracts only the measurements on the mean and standard deviation for each measurement, 
 3) uses descriptive activity names to name the activities in the data set,
 4) appropriately labels the data set with descriptive variable names, and 
 5) from the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Excecution
Downlad the file and unzip it. 
1) First set the path to the location where the folder UCI HAR Dataset
2) then delete all the variables from the working environment
3) upload plyr package for splitting, applying and combining data
4) after having unpacked the folder, it is found that there are 2 files and 2 folders containing the data
5) read and import data from these 2 files
6) then extract data next from the test folder
7) name the columns
8) prepare the test data set by combining x, y and subject data
9) repeat steps 6 to 8 for the train folder
10) combine the test and the train data sets to prepare a full data set
11) extract then the measurements on the mean and standard deviation
12) then use descriptive activity names to name the activities in the data set
13) give syntactically valid names to the variables referring to features_info.txt inside the unzipped folder
14) creates then a second, independent tidy data set with the average of each variable for each activity and each subject


### Extra Information
Please refer to CodeBook.MD file.
