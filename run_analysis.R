library(reshape)
library(dplyr)

basePath= '/tmp/uci-dataset/'

pathTo <- function(fName) {
  res <- paste(c(basePath, fName), sep='', collapse='')
}

readAndMerge <- function(fNames) {
  res = lapply(fNames,function(x) {
    read.table(pathTo(x))
  })
  # merge_recurse is provided by reshape
  merge_recurse(res)
}

### 1. Merge test and training data sets

xFull  <- readAndMerge(c('train/X_train.txt', 'test/X_test.txt'))
sFull  <- readAndMerge(c('train/subject_train.txt', 'test/subject_test.txt'))

# I tried to clean up the reading functions with readAndMerge but get
# unexpected results for yFull, so manually and step by step here

yTest  <- read.table(pathTo("test/y_test.txt"))
yTrain <- read.table(pathTo("train/y_train.txt"))
yFull  <- rbind(yTest, yTrain)
rm(yTest)
rm(yTrain)

### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# Grab the names from features.txt
features <- read.table(pathTo('features.txt'))[,2]

# and apply them to X
names(xFull) <- features

# Logical vector to filter only std and mean measurements
xOnlyMeanAndStd <- xFull[,grepl('-std()|-mean()', colnames(xFull))]

### 3. Uses descriptive activity names to name the activities in the data set

activities <- read.table(pathTo('activity_labels.txt'))[,2]

yFull[,1] <- activities[yFull[,1]]


### 4. Appropriately labels the data set with descriptive variable names. 

# Clean up the names

xNames <- names(xOnlyMeanAndStd)
xNames <- gsub('-mean', '_Mean', xNames)
xNames <- gsub('-std', '_StdDev', xNames)
xNames <- gsub('[-()]', '', xNames)
names(xOnlyMeanAndStd) <- xNames

names(yFull) <- 'activity'
names(sFull) <- 'subject'

combinedSet <- cbind(sFull, yFull, xOnlyMeanAndStd )

### 5. From the data set in step 4, creates a second, independent tidy data set
###    with the average of each variable for each activity and each subject.

# Break down the combinedSet with melt on subject and activity
# This gives us a table of subject,activity,variable,value

res <- melt(combinedSet, id.vars=c('subject', 'activity'))

# Group for processing
res <- group_by(res, subject, activity, variable)

# Calculate mean() for each value and store it in the column 'average'
res <- summarise(res, average=mean(value))

write.table(res, '/tmp/getdata-010-summary.txt', row.names=FALSE, sep=',')

