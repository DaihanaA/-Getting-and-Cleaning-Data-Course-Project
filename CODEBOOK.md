# Getting and Cleaning Data
These where the actions that were required to complete this assigment:
* Merging the training and the test sets to create one data set.
* Extracting only the measurements on the mean and standard deviation for each measurement.
* Useing descriptive activity names to name the activities in the data set
* Appropriately labeling the data set with descriptive variable names.
* Creating a second, independent tidy data set with the average of each variable for each activity and each subject.

# Variables
* features <- features.txt 
* activities <- activity_labels.txt 
* subject_test <- test/subject_test.txt 
* x_test <- test/X_test.txt 
* y_test <- test/y_test.txt
* subject_train <- test/subject_train.txt 
* x_train <- test/X_train.txt
* y_train <- test/y_train.txt

# Merge
* X  is created by merging x_train and x_test using rbind()
* Y  is created by merging y_train and y_test using rbind()
* subject is created by merging subject_train and subject_test using rbind()
* merged_data  is created by merging subject, Y and X using cbind()

# Extraction of measurements on the mean and standard deviation
extract is created by subsetting Merged_Data, selecting only columns: subject, code and the measurements on the mean and standard deviation

# Labels
code column in extract is renamed into activities
All Acc in column’s name replaced by Accelerometer
All Gyro in column’s name replaced by Gyroscope
All BodyBody in column’s name replaced by Body
All Mag in column’s name replaced by Magnitude
All start with character f in column’s name replaced by Frequency
All start with character t in column’s name replaced by Time
