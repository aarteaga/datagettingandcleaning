datagettingandcleaning
======================
This reporistory contains the file run_analysis.R for getting and tidying the data from the source http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones . 
Those data need to be downloaded and decompress.
After that a main folder contains some explanatory files and two folders contain the training ant testing data sets.
The run_analisys.R script must be run from the main folder of decompressed data and it will run the following operations:
1.- It will get the data from the two sets to R and will merge them
2.- It will extract the measurements of the mean and standard deviation for each measurement variable.
3.- It will substitute the numbers describing the activities by the corresponding naming factors to name the activities in the data set.
4. It will label the data set with descriptive activity names. 
5.- It will create a secondt tidy data set with the average of each variable for each activity and each subject.

The final dataset will be called summarydata.
