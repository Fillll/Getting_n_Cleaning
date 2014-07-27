INPUT
-----

The input dataset includes the following files

* 'README.txt'

* 'features_info.txt': Shows information about the variables used on the feature vector.

* 'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

OUTPUT
------

*tidyData.txt

This is a dataset containing 180 observations of 68 variables.

The following are the columns of this dataset:

>subject - the person of interest (30 total subjects)

>activity - the activity name describing one of the following 6 activites:
>            1 WALKING
>            2 WALKING_UPSTAIRS
>            3 WALKING_DOWNSTAIRS
>            4 SITTING
>            5 STANDING
>            6 LAYING

>And the following 66 columns(in addition to above) describing the extracted measurements on the mean and standard deviation for each measurement. 

> tBodyAcc-mean-X
 tBodyAcc-mean-Y
 tBodyAcc-mean-Z
 tBodyAcc-std-X
 tBodyAcc-std-Y
 tBodyAcc-std-Z
 tGravityAcc-mean-X
 tGravityAcc-mean-Y
 tGravityAcc-mean-Z
 tGravityAcc-std-X
 tGravityAcc-std-Y
 tGravityAcc-std-Z
 tBodyAccJerk-mean-X
 tBodyAccJerk-mean-Y
 tBodyAccJerk-mean-Z
 tBodyAccJerk-std-X
 tBodyAccJerk-std-Y
 tBodyAccJerk-std-Z
 tBodyGyro-mean-X
 tBodyGyro-mean-Y
 tBodyGyro-mean-Z
 tBodyGyro-std-X
 tBodyGyro-std-Y
 tBodyGyro-std-Z
 tBodyGyroJerk-mean-X
 tBodyGyroJerk-mean-Y
 tBodyGyroJerk-mean-Z
 tBodyGyroJerk-std-X
 tBodyGyroJerk-std-Y
 tBodyGyroJerk-std-Z
 tBodyAccMag-mean
 tBodyAccMag-std
 tGravityAccMag-mean
 tGravityAccMag-std
 tBodyAccJerkMag-mean
 tBodyAccJerkMag-std
 tBodyGyroMag-mean
 tBodyGyroMag-std
 tBodyGyroJerkMag-mean
 tBodyGyroJerkMag-std
 fBodyAcc-mean-X
 fBodyAcc-mean-Y
 fBodyAcc-mean-Z
 fBodyAcc-std-X
 fBodyAcc-std-Y
 fBodyAcc-std-Z
 fBodyAccJerk-mean-X
 fBodyAccJerk-mean-Y
 fBodyAccJerk-mean-Z
 fBodyAccJerk-std-X
 fBodyAccJerk-std-Y
 fBodyAccJerk-std-Z
 fBodyGyro-mean-X
 fBodyGyro-mean-Y
 fBodyGyro-mean-Z
 fBodyGyro-std-X
 fBodyGyro-std-Y
 fBodyGyro-std-Z
 fBodyAccMag-mean
 fBodyAccMag-std
 fBodyBodyAccJerkMag-mean
 fBodyBodyAccJerkMag-std
 fBodyBodyGyroMag-mean
 fBodyBodyGyroMag-std
 fBodyBodyGyroJerkMag-mean
 fBodyBodyGyroJerkMag-std


TRANSFORMATIONS
---------------

1. The data is downloaded from internet and saved in working directory in a file called: dataset.zip. This data is further extracted into the current working directory under a directory called : "UCI HAR Dataset" . We then reset the working directory to this directory for the duration of program.

2. The data in training set is read under ./train directory and the data in test set is read from ./test. rbind function is used to merge data. 

3. Read features.txt file and extract measurements  on the mean and stdev for each measurement. The resulting dataframe from this transformation stage is of 10299 observations and 66 variables.

4. Read activity_labels.txt and use activity names to name the activities in the data set. 

5. Appropriately label the data set with descriptive activity names. gsub is used to remove brackets ("(" and ")") to clean column names.

6. Tidy dataset is a dataset containing 180 observations of 68 variables. See section "OUTPUT DATASET" above for more details.
