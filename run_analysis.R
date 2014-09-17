#Opening the data. Assuming "UCI HAR Dataset" as the working directory:
train <- read.table("train/X_train.txt")
activity_train <- read.table("train/y_train.txt", col.names="Activity")
subject_train <- read.table("train/subject_train.txt", col.names="Subject")
test <- read.table("test/X_test.txt")
activity_test <- read.table("test/y_test.txt", col.names="Activity")
subject_test <- read.table("test/subject_test.txt", col.names="Subject")
features <- read.table("features.txt")

#Making "features" the variable names of the data sets:
names(train) <- features$V2
names(test) <- features$V2

#Adding activity and subject columns:
train <- cbind(activity_train, train)
train <- cbind(subject_train, train)
test <- cbind(activity_test, test)
test <- cbind(subject_test, test)

#(Step 1) Merging the data sets:
tidy <- rbind(train, test)

#(Step 2) Getting variables of measurements of the mean and the standard deviation
# and creating the final data set:
mean_and_std <- c(grep("mean", names(tidy)), grep("std", names(tidy)))
final <- tidy[,c(1,2,mean_and_std)]

#(Step 3) Using descriptive activity names:
final$Activity <- gsub(1, "Walking", final$Activity)
final$Activity <- gsub(2, "Walking Upstairs", final$Activity)
final$Activity <- gsub(3, "Walking Downstairs", final$Activity)
final$Activity <- gsub(4, "Sitting", final$Activity)
final$Activity <- gsub(5, "Standing", final$Activity)
final$Activity <- gsub(6, "Laying", final$Activity)

#(Step 4) Labeling with descriptive variable names:
names(final) <- gsub("BodyBody", "Body", names(final), fixed=TRUE)
names(final) <- gsub("tBodyAcc", "Time Body Accelerometer ", names(final), fixed=TRUE)
names(final) <- gsub("tBodyGyro", "Time Body Gyroscope ", names(final), fixed=TRUE)
names(final) <- gsub("tGravityAcc", "Time Gravity Accelerometer ", names(final), fixed=TRUE)
names(final) <- gsub("fBodyAcc", "Freq Body Accelerometer ", names(final), fixed=TRUE)
names(final) <- gsub("fBodyGyro", "Freq Body Gyroscope ", names(final), fixed=TRUE)
names(final) <- gsub("-mean()-", "(Mean) ", names(final), fixed=TRUE)
names(final) <- gsub("-mean()", " (Mean) ", names(final), fixed=TRUE)
names(final) <- gsub("-meanFreq()-", " (MeanFreq) ", names(final), fixed=TRUE)
names(final) <- gsub("-meanFreq", " (MeanFreq)", names(final), fixed=TRUE)
names(final) <- gsub("-std()-", "(Std) ", names(final), fixed=TRUE)
names(final) <- gsub("-std()", " (Std) ", names(final), fixed=TRUE)
names(final) <- gsub("()", "", names(final), fixed=TRUE)
names(final) <- gsub(" $", "", names(final))

#(Step 5) Creating the last data set with the averages:
averages <- aggregate(final[,3:81], by=list(final$Subject, final$Activity), mean)
names(averages)[1:2] <- c("Subject", "Activity")
