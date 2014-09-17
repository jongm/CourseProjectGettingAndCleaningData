CourseProjectGettingAndCleaningData
===================================

##run_analysis script description

#### Data preparation:
Seven datasets are loaded into R for the analysis. "train" and "test" contain the measurements data, "activity" contains the activity ID, "subject" contains the individual subjects ID, and "features" contains the column names of the measurements.

"features" is used to indicate the names of the columns in "train" and "test".

The "subject" and "activity" datasets are column binded (cbind) to the "train" and "test" datasets.

####Step 1
A "tidy" dataset is created by row binding (rbind) the "train" and "test" datasets.

####Step 2
The command (grep) is used to obtain the measurements that have mean and std in their names. The ids of these measurements along with ids 1 (subject) and 2 (activity) are used to indicate the columns of the final dataset.

####Step 3
The command (gsub) is used to replace the numbers 1 through 6 in "activity" with their respective activity names.

####Step 4
The command (gsub) is used repeatedly to change the names of the measurements to something more readable.

####Step 5
The last dataset containing the averages of the mean and the std across subjects and activities is created.
For this, the command (aggregate) is used to apply the function (mean) to colmuns 3 through 81 (the measurements) according to "subject" and "activity".
