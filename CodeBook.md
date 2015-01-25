# Code book for Coursera getdata-010 assignment

The data was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### 1. Merge test and training data sets

For the initial loading of the data into R the different types (test, train) are combined for each category (X, subject and y). The files are,

    test/X_test.txt
    test/subject_test.txt
    test/y_test.txt

    train/X_train.txt
    train/y_train.txt
    train/subject_train.txt

The files are loaded into R and combined using ```rbind```. and assigned to variables ```xFull```, ```yFull```, ```sFull```.

### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 


Descriptive values of the 

    activity_labels.txt
    features.txt
