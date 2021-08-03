CodeBook
================

<div style="border: 5px solid black; padding: 10px 20px; background-color:#ededed; box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);">

1.  **Description**

<!-- end list -->

  - The `run_analysis.R` script performs the data preparation and
    successively conducts by the 5 steps required as described in the
    course project’s definition.

<!-- end list -->

2.  **Source Data**

<!-- end list -->

  - Dataset downloaded and extracted under the folder called `UCI HAR
    Dataset`, which could be downloaded here [UCI Machine Learning
    Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
    
    <br/>

<!-- end list -->

3.  **Data Set Overview**

<!-- end list -->

  - The experiments have been carried out with a group of 30 volunteers
    within an age bracket of 19-48 years. Each person performed six
    activities (**WALKING**, **WALKING\_UPSTAIRS**,
    **WALKING\_DOWNSTAIRS**, **SITTING**, **STANDING**, **LAYING**)
    wearing a smartphone (Samsung Galaxy S II) on the waist. Using its
    embedded accelerometer and gyroscope, we captured 3-axial linear
    acceleration and 3-axial angular velocity at a constant rate of
    50Hz. The experiments have been video-recorded to label the data
    manually. The obtained dataset has been randomly partitioned into
    two sets, where 70% of the volunteers was selected for generating
    the training data and 30% the test data.
    
    <br/>

<!-- end list -->

4.  **Assign each data to variables**
      - `features` \<- `features.txt` : 561 rows, 2 columns <br/> *The
        features selected for this database come from the accelerometer
        and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.*
      - `activities` \<- `activity_labels.txt` : 6 rows, 2 columns <br/>
        *List of activities performed when the corresponding
        measurements were taken and its codes (labels)*
      - `subject_test` \<- `test/subject_test.txt` : 2947 rows, 1 column
        <br/> *contains test data of 9/30 volunteer test subjects being
        observed*
      - `x_test` \<- `test/X_test.txt` : 2947 rows, 561 columns <br/>
        *contains recorded features test data*
      - `y_test` \<- `test/y_test.txt` : 2947 rows, 1 columns <br/>
        *contains test data of activities’code labels*
      - `subject_train` \<- `test/subject_train.txt` : 7352 rows, 1
        column <br/> *contains train data of 21/30 volunteer subjects
        being observed*
      - `x_train` \<- `test/X_train.txt` : 7352 rows, 561 columns <br/>
        *contains recorded features train data*
      - `y_train` \<- `test/y_train.txt` : 7352 rows, 1 columns <br/>
        *contains train data of activities’code labels*
    <br/>
5.  **Merges the training and the test sets to create one data set**
      - `data_X` (10299 rows, 561 columns) is created by merging
        `x_train` and `x_test` using **rbind()** function
      - `data_Y` (10299 rows, 1 column) is created by merging `y_train`
        and `y_test` using **rbind()** function
      - `data_subject` (10299 rows, 1 column) is created by merging
        `subject_train` and `subject_test` using **rbind()** function
      - `merged_data` (10299 rows, 563 column) is created by merging
        `data_subject`, `data_X` and `data_Y` using **cbind()** function
    <br/>
6.  **Extracts only the measurements on the mean and standard deviation
    for each measurement**

<!-- end list -->

  - `summary_data` (10299 rows, 88 columns) is created by subsetting
    `merged_data`, selecting only columns: `subject`, `code` and the
    measurements on the `mean` and *standard deviation* (`std`) for each
    measurement
    
    <br/>

<!-- end list -->

5.  **Uses descriptive activity names to name the activities in the data
    set**

<!-- end list -->

  - Entire numbers in `code` column of the `summary_data` replaced with
    corresponding activity taken from second column of the `activities`
    variable
    
    <br/>

<!-- end list -->

7.  **Appropriately labels the data set with descriptive variable
    names**
      - `code` column in `summary_data` renamed into `activities`
      - All `Acc` in column’s name replaced by `Accelerometer`
      - All `Gyro` in column’s name replaced by `Gyroscope`
      - All `BodyBody` in column’s name replaced by `Body`
      - All `Mag` in column’s name replaced by `Magnitude`
      - All start with character `f` in column’s name replaced by
        `Frequency`
      - All start with character `t` in column’s name replaced by `Time`
    <br/>
8.  **From the data set in step 4, creates a second, independent tidy
    data set with the average of each variable for each activity and
    each subject**
      - `DataFinal` (180 rows, 88 columns) is created by summarizing
        `summary_data` retrieving the mean values of each variable for
        each activity combined with each subject, after being groupped
        by subject and activity.
      - Export `DataFinal` into `DataFinal.txt` file.

</div>

<br/>
