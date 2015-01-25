

#import raw data
activity_labels <- read.table(file = "getdata-projectfiles-UCI HAR Dataset/activity_labels.txt")
features <- read.table(file = "getdata-projectfiles-UCI HAR Dataset/features.txt", stringsAsFactors = F)

X_test <- read.table(file = "getdata-projectfiles-UCI HAR Dataset/test/X_test.txt")
y_test <- read.table(file = "getdata-projectfiles-UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table(file = "getdata-projectfiles-UCI HAR Dataset/test/subject_test.txt")


X_train <- read.table(file = "getdata-projectfiles-UCI HAR Dataset/train/X_train.txt")
y_train <- read.table(file = "getdata-projectfiles-UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table(file = "getdata-projectfiles-UCI HAR Dataset/train/subject_train.txt")

#combining test and training data sets
library(dplyr)

X <- bind_rows(X_train, X_test)
y <- bind_rows(y_train, y_test)
subject <- bind_rows(subject_train, subject_test)

#assembling whole data set (subject, activity, measurements)
data_raw <- bind_cols(subject, y, X)

#renaming variables
var_names <- c("subject", "actID", features$V2)
names(data_raw) <- var_names

names(activity_labels) <- c("id", "activity")

#removing unnecessary objects
rm(X, X_test, X_train, y, y_test, y_train, subject, subject_test, subject_train, features)

#subset of all columns containing "mean" and "std" of taken measurements 
#as well as subject and activity.
#magnitude and time derived data was excluded as it is no 
#"mean and standard deviation for each measurement"
data_sub <- data_raw[,grepl("mean\\(\\)|std\\(\\)|subject|actID", names(data_raw)) &
                       !grepl("Mag|Jerk", names(data_raw))]

#introduce speaking activity names
data_merged <- merge(data_sub, activity_labels,by.x = "actID", by.y = "id")

#drop unnecessary column actID
data <- data_merged[, -("actID" %in% names(data_merged))]

#alter variable names for easier reading
#(1) remove "-" and "()"
names(data) <- gsub("-|\\(\\)", "", names(data))
#(2) introduce camelCase
names(data) <- gsub("mean", "Mean", names(data))
names(data) <- gsub("std", "Std", names(data))

#removing unnecessary objects
rm(data_raw, data_sub, data_merged, activity_labels, var_names)

#create a summary of the data grouped by subject and activity, 
#calculating means of each measurement
data_summary <- data %>% group_by(subject, activity) %>% summarise_each(funs(mean))

#creating output
write.table(data_summary, row.names = F, file = "data_summary.txt")
