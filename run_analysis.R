#Proyect Course 3 data cleaning

setwd("//tsclient/C/home/coursera/spe_data_analsysis/3_getting_cleaning_data/project/UCI HAR Dataset")
setwd("G:/lana/home/coursera/spe_data_analsysis/3_getting_cleaning_data/project/UCI HAR Dataset")
library(doBy)

treat_one_set<-function(dataset="train") {
  # This function gets the data and joins different parts from 
  # different files, it works from one folder got in the call
    str_x<-paste0(dataset, "/x_", dataset, ".txt")
    str_y<-paste0(dataset, "/y_", dataset, ".txt")
    str_subject<-paste0(dataset, "/subject_" , dataset, ".txt")
    y<-read.table(str_y)
    x<-read.table(str_x)
    subject<-read.table(str_subject)
    features<-read.table("features.txt")
    activity_labels<-read.table("activity_labels.txt")
    # Names are got from the features files
    names(x)<-features$V2
    # Only variables with mean or standard deviation values are selected
    x2<-x[,grep("mean|std", features$V2)]
    y<-as.factor(y$V1)
    #The levels of the activity names are renamed accordingly
    levels(y)<-activity_labels$V2
    x3<-cbind(x2, subject=subject$V1, activity=y)
}

# The function treat_one_set is executed twice for the training and test data
train_data<-treat_one_set(dataset="train")
test_data<-treat_one_set(dataset="test")
# The two data sets are combined
all_data<-rbind(train_data, test_data)
# The names of the variables are changed to eliminate -, ( and ) 
names(all_data)<-gsub("-", "", names(all_data))
names(all_data)<-gsub("\\(", "", names(all_data))
names(all_data)<-gsub("\\)", "", names(all_data))
# Final summary with the function summaryBy from the package doBy
summarydata<-summaryBy(.~subject + activity , data = all_data, FUN = mean)







