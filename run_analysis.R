# Getting and Cleaning Data

# This run_analysis.R script does the following: 
# 
# 1) merges the training and the test sets to create one data set,
# 2) extracts only the measurements on the mean and standard deviation for each measurement, 
# 3) uses descriptive activity names to name the activities in the data set,
# 4) appropriately labels the data set with descriptive variable names, and 
# 5) from the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#First set the path to the location where the folder UCI HAR Dataset (after unzipping getdata_projectfiles_UCI HAR Dataset)
# exists
setwd("~/Coursera/Getting and Cleaning Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")

# Then delete all the variables from the working environment
rm(list=ls())

# upload plyr package for splitting, applying and combining data
library(plyr)

###################################################################################################
# 1) Merge the training and the test sets to create one data set
###################################################################################################
# **** Start of part 1 **** #

# After having unpacked the folder, it is found that there are 2 files and 2 folders containing the data

#So, let us read and import data from these 2 files, namely activity_labels.txt and features.txt 
# read.table command is used to import the data
activity_TYPE <- read.table('./activity_labels.txt',header=FALSE)
features     <- read.table('./features.txt',header=FALSE)

# It is inferred that: 
# 1) activity_TYPE has 6 observations in 2 columns
# 2) features has 561 observations in 2 columns

# The columns in the activity_TYPE file are given names
colnames(activity_TYPE)  <- c('activity_ID','activity_TYPE')

# Now let us extract data next from the test folder
# It has one folder and three text files
# Read and import the test data from different text files using the read.table command
y_TEST       <- read.table('./test/y_test.txt',header=FALSE)    
subject_TEST <- read.table('./test/subject_test.txt',header=FALSE)
x_TEST       <- read.table('./test/x_test.txt',header=FALSE)

# It is seen that:
# 1) y_TEST has 2947 observations in 1 column
# 2) subject_TEST has 2947 observations in 1 column
# 3) x_TEST has 2947 observations in 561 columns

# The columns in the above test files are given names
colnames(subject_TEST) <- "subject_ID" 
colnames(x_TEST)       <- features[,2] 
colnames(y_TEST)       <- "activity_ID"

# After having assigned columns names, a test data set is finally developed by combining the above three files through
test_DATA_SET <- cbind(y_TEST,subject_TEST,x_TEST)

# We repeat the above procedure to the train folder
# It has one folder and three text files
# Read and import the test data from different text files using the read.table command
y_TRAIN       <- read.table('./train/y_train.txt',header=FALSE)
subject_TRAIN <- read.table('./train/subject_train.txt',header=FALSE)
x_TRAIN       <- read.table('./train/x_train.txt',header=FALSE)

# Is is observed that:
# 1) y_TRAIN has 7532 observations in 1 column
# 2) subject_TRAIN has 7532 observations in column
# 3) x_TRAIN has 7532 observations in 561 columns

# Assigning column names to the above imported data is performed next
colnames(subject_TRAIN)  <- "subject_ID"
colnames(x_TRAIN)        <- features[,2] 
colnames(y_TRAIN)        <- "activity_ID"

# Finally, a train data set is prepared by combining the above 3 train imported files through
training_DATA_SET <- cbind(y_TRAIN,subject_TRAIN,x_TRAIN)

# Now that the test and train data has been prepared, a final combined data set can be prepared using rbind 
# by combining the test and the train data sets
COMBINED_FINAL_DATA_SET <- rbind(training_DATA_SET,test_DATA_SET)


# **** End of part 1 **** #

###################################################################################################
# 2) Extracts only the measurements on the mean and standard deviation for each measurement
###################################################################################################
# **** Start of part 2 **** #

# This generated vector is used to select the desired mean and standard deviation columns
column_NAMES  <- colnames(COMBINED_FINAL_DATA_SET);

# In the below vector, the average, dispersion and ID columns are TRUE (others are assigned FALSE)
average <- (grepl("-mean\\(\\)",column_NAMES))
dispersion <- (grepl("-std\\(\\)",column_NAMES))
activities <- (grepl("activity",column_NAMES))
subjects <- (grepl("subject",column_NAMES))
average_variation <- (average | dispersion | activities | subjects) 

# Subset COMBINED_FINAL_DATA_SET table based on the Mean_Stddev_ID_TRUE to keep only desired columns
COMBINED_FINAL_DATA_SET <- COMBINED_FINAL_DATA_SET[average_variation==TRUE] 

# **** End of part 2 **** #
###################################################################################################
# 3) Use descriptive activity names to name the activities in the data set
###################################################################################################
# **** Start of part 3 **** #

#  To add descriptive activity names, join COMBINED_FINAL_DATA_SET and acitivity_TYPE table
COMBINED_FINAL_DATA_SET <- merge(COMBINED_FINAL_DATA_SET,activity_TYPE,by='activity_ID',all.x=TRUE)

# **** End of part 3 **** #
###################################################################################################
# 4) Appropriately label the data set with descriptive activity names
###################################################################################################
# **** Start of part 4 **** #

# To give syntactically valid names to the variables referrring to features_info.txt
names(COMBINED_FINAL_DATA_SET) <- sub("tBodyAccJerk", "Jerk_Acceleration_Time", names(COMBINED_FINAL_DATA_SET))
names(COMBINED_FINAL_DATA_SET) <- sub("tBodyGyroJerk", "Jerk_Velocity_Time", names(COMBINED_FINAL_DATA_SET))
names(COMBINED_FINAL_DATA_SET) <- sub("tBodyAccMag", "Magnitude_Acceleration_Time", names(COMBINED_FINAL_DATA_SET))
names(COMBINED_FINAL_DATA_SET) <- sub("tGravityAccMag", "Magnitude_GravitationalAcceleration_Time", names(COMBINED_FINAL_DATA_SET))
names(COMBINED_FINAL_DATA_SET) <- sub("tBodyAccJerkMag", "Magnitude_Jerk_Acceleration_Time", names(COMBINED_FINAL_DATA_SET))
names(COMBINED_FINAL_DATA_SET) <- sub("tBodyGyroMag", "Magnitude_Velocity_Time", names(COMBINED_FINAL_DATA_SET))
names(COMBINED_FINAL_DATA_SET) <- sub("tBodyGyroJerkMag", "Magnitude_Jerk_Velocity_Time", names(COMBINED_FINAL_DATA_SET))
names(COMBINED_FINAL_DATA_SET) <- sub("tBodyAcc", "Acceleration_in_Time", names(COMBINED_FINAL_DATA_SET))
names(COMBINED_FINAL_DATA_SET) <- sub("tGravityAcc", "Gravitational_Acceleration_in_Time", names(COMBINED_FINAL_DATA_SET))
names(COMBINED_FINAL_DATA_SET) <- sub("tBodyGyro", "Velocity_in_Time", names(COMBINED_FINAL_DATA_SET))
names(COMBINED_FINAL_DATA_SET) <- sub("fBodyAcc", "Acceleration_Frequency", names(COMBINED_FINAL_DATA_SET))
names(COMBINED_FINAL_DATA_SET) <- sub("fBodyAccJerk", "Jerk_Acceleration_Frequency", names(COMBINED_FINAL_DATA_SET))
names(COMBINED_FINAL_DATA_SET) <- sub("fBodyGyro", "Velocity_Frequency", names(COMBINED_FINAL_DATA_SET))
names(COMBINED_FINAL_DATA_SET) <- sub("fBodyAccMag", "Magnitude_Acceleration_Frequency", names(COMBINED_FINAL_DATA_SET))
names(COMBINED_FINAL_DATA_SET) <- sub("fBodyBodyAccJerkMag", "Magnitude_Jerk_Acceleration_Frequency", names(COMBINED_FINAL_DATA_SET))
names(COMBINED_FINAL_DATA_SET) <- sub("fBodyBodyGyroMag", "Magnitude_Velocity_Frequency", names(COMBINED_FINAL_DATA_SET))
names(COMBINED_FINAL_DATA_SET) <- sub("fBodyBodyGyroJerkMag", "Magnitude_Jerk_Velocity_Frequency", names(COMBINED_FINAL_DATA_SET))


# **** End of part 4 **** #
###################################################################################################
# 5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
###################################################################################################
# **** Start of part 5 **** #

# Creating a second second, independent tidy data set with the average of each variable for each activity and each subject 
Tidy_Data <- ddply(COMBINED_FINAL_DATA_SET, c("activity_ID","subject_ID"), numcolwise(mean))
# Export the Clean_Data set as a text file 
write.table(Tidy_Data, './Tidy_Data_Set.txt',row.names=TRUE,sep='\t');

# **** End of part 5 **** #


