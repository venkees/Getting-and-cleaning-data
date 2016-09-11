
fitbit_data(){

  setwd("D:/2016/Pers/Learning/Course 3 - Getting and Cleaning Data/Project")
  # reading the test data
  x_test<- read.table("D:/2016/Pers/Learning/Course 3 - Getting and Cleaning Data/Project/Data/UCI HAR Dataset/test/X_test.txt")
  y_test<- read.table("D:/2016/Pers/Learning/Course 3 - Getting and Cleaning Data/Project/Data/UCI HAR Dataset/test/Y_test.txt")
  sub_test <- read.table("D:/2016/Pers/Learning/Course 3 - Getting and Cleaning Data/Project/Data/UCI HAR Dataset/test/subject_test.txt")

  # reading the training data
  x_train <- read.table("D:/2016/Pers/Learning/Course 3 - Getting and Cleaning Data/Project/Data/UCI HAR Dataset/train/X_train.txt")
  y_train <- read.table("D:/2016/Pers/Learning/Course 3 - Getting and Cleaning Data/Project/Data/UCI HAR Dataset/train/Y_train.txt")
  sub_train <- read.table("D:/2016/Pers/Learning/Course 3 - Getting and Cleaning Data/Project/Data/UCI HAR Dataset/train/subject_train.txt")

  library(dplyr)
  

  #Part 1 - Merges the training and the test sets to create one data set
  x_list<-rbind(x_test,x_train)  
  y_list<-rbind(y_test,y_train)
  sub_list<-rbind(sub_test,sub_train)

  # the final merged file is part of part 4 and has been named as list_final
  
  #Part 1 - Extracts only the measurements on the mean and standard deviation for each measurement
  
  features<-read.table("D:/2016/Pers/Learning/Course 3 - Getting and Cleaning Data/Project/Data/UCI HAR Dataset/features.txt")
  activity<-read.table("D:/2016/Pers/Learning/Course 3 - Getting and Cleaning Data/Project/Data/UCI HAR Dataset/activity_labels.txt")

  index_feat<-grep("mean\\(\\)|std\\(\\)", features[,2])
  x_list_meanstd<-x_list[,index_feat]
  
  
  #Part 3 - Uses descriptive activity names to name the activities in the data set
  # for each value of y_list, it will find the corresponding activity name and then update in the main table y_list
    y_list[,1]<-activity[y_list[,1],2]

  #Part 4 - Appropriately labels the data set with descriptive variable names.    
  
    featnames<-features[index_feat,2]
    featnames<-gsub("\\(\\)","",featnames)
    featnames<-gsub("^t","Time",featnames)
    featnames<-gsub("^f","Frequency",featnames)
    featnames<-gsub("Acc","Accelerometer",featnames)
    featnames<-gsub("Gyro","Gyroscope",featnames)
    featnames<-gsub("std","StandardDeviation",featnames)
    names(x_list_meanstd)<-featnames
    
    y_list<-rename(y_list, ActivityName=V1)
    sub_list<-rename(sub_list,Subject=V1)
    list_final<-cbind(sub_list,y_list,x_list_meanstd)
    
 #Part 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    tidy_data<-aggregate(list_final[,3:68],by=list(Subject=list_final$Subject, Activity=list_final$ActivityName),FUN = mean)    
    write.table(x = tidy_data, file = "D:/2016/Pers/Learning/Course 3 - Getting and Cleaning Data/Project/Data/UCI HAR Dataset/tidy_data.txt", row.names = FALSE)         
}
