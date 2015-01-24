
basePath= '/home/moondust/tmp/uci-dataset/'

pathTo <- function(fName) {
  res <- paste(c(basePath, fName), sep='', collapse='')
}

# readAndMerge <- function(fNames) {
#   rbind(vapply(fNames,function(x) {
#     read.table(pathTo(x))
#   }, data.frame
#   ))
# }
# xFull  <- readAndMerge(c('train/X_train.txt', 'test/X_test.txt'))

xTrain <- read.table(pathTo('train/X_train.txt'))
xTest  <- read.table(pathTo('test/X_test.txt'))
xFull  <- rbind(xTrain, xTest)
rm(xTrain)
rm(xTest)

yTrain <- read.table(pathTo('train/y_train.txt'))
yTest  <- read.table(pathTo('test/y_test.txt'))
yFull  <- rbind(yTrain, yTest)
rm(yTrain)
rm(yTest)

sTrain <- read.table(pathTo('train/subject_train.txt'))
sTest  <- read.table(pathTo('test/subject_test.txt'))
sFull  <- rbind(sTrain, sTest)
rm(sTrain)
rm(sTest)

# Grab the names from features.txt and apply them to X
featureNames <- read.table(pathTo('features.txt'))[,2]
names(xFull) <- featureNames

# Logical vector to filter only std and mean measurements
xOnlyMeanAndStd <- xFull[,grepl('-std|-mean', colnames(xFull))]

