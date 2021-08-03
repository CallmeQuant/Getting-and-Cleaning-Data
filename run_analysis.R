#---------------
# Download data 
#---------------

# Clear working space

rm(list=ls())

# Defining URL for downloading

fileurl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Examining whether archive and folderalready exists 

if (!file.exists('./UCI HAR Dataset.zip')){
  download.file(fileurl,'./UCI HAR Dataset.zip', mode = 'wb')
  unzip("UCI HAR Dataset.zip", exdir = getwd())
}


# Importing data using data.table

library(data.table)

feature <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activity <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = feature$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = feature$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

#--------------------------------------------------------------
# Merges the training and the test sets to create one data set
#--------------------------------------------------------------

# Subject dataset

data_subject <- rbind(subject_test, subject_train)
names(data_subject) <- c("subject")
rm('subject_test')
rm('subject_train')

# X dataset

data_X <- rbind(x_test, x_train)

# Y dataset

data_Y <- rbind(y_test, y_train)

# Merge 3 datasets

merged_data <- cbind(data_subject, data_X, data_Y)

# Remove unescessary data after merging

rm('x_test','x_train','y_test','y_train')

# Extracts only the measurements on the mean
# and standard deviation for each measurement.

library(dplyr)
library(kableExtra)   # Good table looking
summary_data <- merged_data %>%
  select(subject, code, contains("mean"), contains("std"))

# Nice formatting for table 

kbl(summary_data, caption = "Table: Mean and Standard deviation each 
      measurement", escape = TRUE) %>%
  kable_classic(full_width = FALSE, html_font = "Cambria")

# Uses descriptive activity names to name the activities in the data set.

summary_data$code <- activity[summary_data$code, 2]

#  Appropriately labels the data set with descriptive variable names.


names(summary_data)[2] = "activity"
names(summary_data)<-gsub("Acc", "Accelerometer", names(summary_data))
names(summary_data)<-gsub("Gyro", "Gyroscope", names(summary_data))
names(summary_data)<-gsub("BodyBody", "Body", names(summary_data))
names(summary_data)<-gsub("Mag", "Magnitude", names(summary_data))
names(summary_data)<-gsub("^t", "Time", names(summary_data))
names(summary_data)<-gsub("^f", "Frequency", names(summary_data))
names(summary_data)<-gsub("tBody", "TimeBody", names(summary_data))
names(summary_data)<-gsub("-mean()", "Mean", names(summary_data), ignore.case = TRUE)
names(summary_data)<-gsub("-std()", "STD", names(summary_data), ignore.case = TRUE)
names(summary_data)<-gsub("-freq()", "Frequency", names(summary_data), ignore.case = TRUE)
names(summary_data)<-gsub("angle", "Angle", names(summary_data))
names(summary_data)<-gsub("gravity", "Gravity", names(summary_data))

# From the data set in step 4, creates a second
# independent tidy data set with the average of each variable for each activity and each subject.
data_final <- summary_data %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))

write.table(data_final, "DataFinal.txt", row.name=FALSE)











