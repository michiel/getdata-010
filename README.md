# getdata-010 - Assignment


This repository contains the peer assesment assignment for Coursera getdata-010.

The main items are the analysis script ```run_analysis.R``` and the data set it
operates on. To get started,

  * Download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  * Extract it to a local directory.
  * The name of the local directory is important and has to be set at the top of the ```run_analysis.R``` script. - If you do not set the basePath it will default to the current directory.
  * Run ```source('run_analysis.R')``` having set the basePath variable to the data directory

The resulting data file can be read back using the following R code,

    data <- read.table('/tmp/getdata-010-summary.txt', sep=',')

The steps taken in the analysis script are detailed in the file CodeBook.md





