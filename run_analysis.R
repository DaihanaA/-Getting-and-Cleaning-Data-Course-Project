library(dplyr)
features <- read.table("C:/Users/TODO EN UNO LENOVO/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("C:/Users/TODO EN UNO LENOVO/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("C:/Users/TODO EN UNO LENOVO/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("C:/Users/TODO EN UNO LENOVO/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("C:/Users/TODO EN UNO LENOVO/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("C:/Users/TODO EN UNO LENOVO/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("C:/Users/TODO EN UNO LENOVO/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("C:/Users/TODO EN UNO LENOVO/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", col.names = "code")

X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
merged_data <- cbind(subject, Y, X)
extract <- merged_data %>% 
  select(subject, code, contains("mean"), contains("std"))
extract$code <- activities[extract$code, 2]

colnames(extract)[2] <- "activity"
names(extract)<-gsub("Acc", "Accelerometer", names(extract))
names(extract)<-gsub("Gyro", "Gyroscope", names(extract))
names(extract)<-gsub("BodyBody", "Body", names(extract))
names(extract)<-gsub("Mag", "Magnitude", names(extract))
names(extract)<-gsub("^t", "Time", names(extract))
names(extract)<-gsub("^f", "Frequency", names(extract))
names(extract)<-gsub("tBody", "TimeBody", names(extract))
names(extract)<-gsub("-mean()", "Mean", names(extract), ignore.case = TRUE)
names(extract)<-gsub("-std()", "STD", names(extract), ignore.case = TRUE)
names(extract)<-gsub("-freq()", "Frequency", names(extract), ignore.case = TRUE)
names(extract)<-gsub("angle", "Angle", names(extract))
names(extract)<-gsub("gravity", "Gravity", names(extract))


theone <- extract %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(theone, "FinalData.txt", row.name=FALSE)

str(theone)
theone
