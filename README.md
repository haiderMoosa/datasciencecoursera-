# datasciencecoursera-
My Data Sceice Repository
The Run_Analysis.R script does not use any files under the Inertial Signals directories for both test and train sets.
The script follows the following steps;
a. First it sets the working director.
b. It creats a subdirectory to keep all the project data in.
c. It downloads the zip file and then unzip it.
d. It reads the activity, subject, and features data for both train and test sets in different variables.
f. It binds the three test and train sets together.
g. It renames the subgect data set column from V1 to subect, the activity data set from V1 to Activity, 
extract the names from features.txt file and rename the features data set according to these names.
h. Eventually, it combines all the above three data sets into one.
i. It extracts only the measurements on the mean and standard deviation for each measurement
j. It uses descriptive activity names to name the activities in the data set
k. It appropriately labels the data set with descriptive variable names; for example, Acc to Accelerometer
l. Andinally, it creates an independent tidy data set with the average of each variable for each activity and each subject 
with applying the lapply function and write.table function
