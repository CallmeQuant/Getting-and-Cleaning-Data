README
================

<div style="border: 5px solid black; padding: 10px 20px; background-color:#ededed; box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);">

# Getting and Cleaning Data Course Project

You can find the course
[here](https://www.coursera.org/learn/data-cleaning). This project is
the last part of the course mentioned earlier which scruntinizes your
ability to perform fundamental steps on data such as collecting,
importing, cleaning. It is required to submit: 1) a tidy data set as
described below, 2) a link to a Github repository with your script for
performing the analysis, and 3) a code book that describes the
variables, the data, and any transformations or work that you performed
to clean up the data called CodeBook.md. You should also include a
README.md in the repo with your scripts. This repo explains how all of
the scripts work and how they are connected.

# Dataset

A full description of data using in this project could be found here:
[Human Activity Recognition Using
Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
For the project only, this version is requisite
\[<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>\].

# Executing

**Packages required** data.table and dplyr (kableExtra is optional for
formatting table) **Running**

  - `CodeBook.md` a code book that describes the variables, the data,
    and any transformations or work that I performed to clean up the
    data

  - `run_analysis.R` performs the data preparation and then followed by
    the 5 steps required as described in the course project’s
    instructions:
    
      - Merges the training and the test sets to create one data set.
      - Extracts only the measurements on the mean and standard
        deviation for each measurement.
      - Uses descriptive activity names to name the activities in the
        data set
      - Appropriately labels the data set with descriptive variable
        names.
      - From the data set in step 4, creates a second, independent tidy
        data set with the average of each variable for each activity and
        each subject.

  - `DataFinal.txt` is the exported final data after executing through
    all the procedures illustrated so far.

</div>

<br/>
