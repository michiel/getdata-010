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


Descriptive values of the measurement data (in ```xFull```) is found in the file ```features.txt```. This file is loaded and the second column containing the names (```[,2]```) is used to assign descriptive names to the ```xFull``` columns.

The names of the columns also contain the measurement types and we are only interested in the standard deviation and mean values. To filter out other columns a logical vector is used that matches only columns whose names contain the strings ```-std()``` or ```-mean()```. The result is assigned to ```xOnlyMeanAndStd```.


### 3. Uses descriptive activity names to name the activities in the data set

The descriptive (character) values of the activities (which are numeric in ```yFull```) are in the file ```activity_labels.txt```. This is read as a table from which the second column containing the activity names (```[,2]```) is assigned to the variable ```activities```.

The numeric activity values in the  ```yFull``` are replaced with their corresponding names from ```activities```.

### 4. Appropriately labels the data set with descriptive variable names. 

To clean up and assign 


### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
