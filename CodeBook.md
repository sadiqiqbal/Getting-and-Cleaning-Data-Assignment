Code Book for run_analysis.R
============================

### Data set

UCI Machine Learning repository: Human Activity Recognition Using Smartphones Data Set

### Signals

The set of variables that were estimated from these signals are: 

*  mean(): Mean value
*  std(): Standard deviation
*  mad(): Median absolute deviation 
*  max(): Largest value in array
*  min(): Smallest value in array
*  sma(): Signal magnitude area
*  energy(): Energy measure. Sum of the squares divided by the number of values. 
*  iqr(): Interquartile range 
*  entropy(): Signal entropy
*  arCoeff(): Autoregression coefficients with Burg order equal to 4
*  correlation(): Correlation coefficient between two signals
*  maxInds(): Index of the frequency component with largest magnitude
*  meanFreq(): Weighted average of the frequency components to obtain a mean frequency
*  skewness(): Skewness of the frequency domain signal 
*  kurtosis(): Kurtosis of the frequency domain signal 
*  bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
*  angle(): Angle between some vectors.

### Feature selection

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
For more details, refer to features_info.txt.

### Variables used in this code

* x_TEST: test x data
* y_TEST: test y data
* subject_TEST: test subject data
* test_DATA_SET: combined test data
* x_TRAIN : test x data
* y_TRAIN : test y data
* subject_TRAIN: test subject data
* training_DATA_SET: combined train data
* COMBINED_FINAL_DATA_SET: combined test and train data
* column_NAMES: gives column names
* average_variation: measurement on the mean, standard deviation
* Tidy_Data: represents the tidy clean data

To give syntactically valid names to the variables, rename the names on the left hand side below to the one
on the right hand side. For a detailed explanation, refer to features_info.txt.

* tBodyAccJerk = Jerk_Acceleration_Time
* tBodyGyroJerk = Jerk_Velocity_Time
* tBodyAccMag = Magnitude_Acceleration_Time
* tGravityAccMag = Magnitude_GravitationalAcceleration_Time
* tBodyAccJerkMag = Magnitude_Jerk_Acceleration_Time
* tBodyGyroMag = Magnitude_Velocity_Time
* tBodyGyroJerkMag = Magnitude_Jerk_Velocity_Time
* tBodyAcc = Acceleration_in_Time
* tGravityAcc = Gravitational_Acceleration_in_Time
* tBodyGyro = Velocity_in_Time
* fBodyAcc = Acceleration_Frequency
* fBodyAccJerk = Jerk_Acceleration_Frequency
* fBodyGyro = Velocity_Frequency
* fBodyAccMag = Magnitude_Acceleration_Frequency
* fBodyBodyAccJerkMag = Magnitude_Jerk_Acceleration_Frequency
* fBodyBodyGyroMag = Magnitude_Velocity_Frequency
* fBodyBodyGyroJerkMag = Magnitude_Jerk_Velocity_Frequency

### Identifiers
* subject: test subject ID
* activity: type of activity performed


References
----------

1) http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
2) https://cran.r-project.org/web/packages/plyr/index.html
3) http://www.endmemo.com/program/R/grepl.php

