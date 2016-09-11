### Project Description

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

### Codebook information

This code book describes the different variables, data and some of the 
transformations that have been done has part of this project

### Different variables and tables that were used

Test data was imported in to x_test, y_test, and sub_test tables using read.table command
Training data was imported in to x_train, y_train, and sub_train tables using read.table command
Features data was imported into features table
activity_labels data was imported into activity table

index_feat - this contains the columns numbers having the words mean or std
x_list_meanstd - this table has only columns that contained the words mean or std (66 columns only)
featnames - this contains the column names that has the words mean or std
list_final - merged list with data, subject and activity information
tidy_data - cleaned up table with the average of each variable for each activity and each subject


### Functions that were used

read.table - to read information from the files
rbind - to combine tables with same number of columns
cbind - to combine tables with same number of rows
grep - to look for specific pattern like mean and std in features table
gsub - to identify and replace specific text patterns
aggregate - calcuate the average and aggregate by Subject and ActivityName
write.table - to create the tidy data in a file


