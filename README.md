---
title: "README"
author: "Alexander Li"
date: "Friday, October 24, 2014"
---

The R script run_analysis.R combines data from several data sets describing readings captured by Samsung Galaxy S Smartphone accelerometers. In order to run the script, the following data sets will be required:

subject_test.txt - identifies the subject # to whom each row of measurements belongs in the test data set

subject_train.txt - identifies the subject # to whom each row of measurements belongs in the training data set

X_test.txt - test data set

X_train.txt - training data set

y_test.txt - identifies the activity performed which created each row of measurements in the test data set

y_train.txt - identifies the activity performed which created each row of measurements in the training data set

features.txt - describes what each column of measurements is a measurement of



All of these files are provided by the UCI Machine Learning Repository at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

Once all of these data sets are collected in the working directory containing "run_analysis.R", the script should execute to combine elements of the data sets and create a tidy data set containing the average values of each of the different accelerometer readings. These averages are calculated over subjects and activities. 

The following is an overview of the specifics of the "run_analysis.R" script:

"run_analysis.R" begins by selecting a subset of the variables measured in the original data set. This subset is comprised of the mean() and std() measurements for each signal. The script proceeds to combine data from the test set and the training set only for the this subset of variables. 

At this point, the developing data set lacks variable names or any identifiers concerning subject number or activity performed. The next steps add these labels to the data set to make the data set self-explantory. 

Finally, "run_analysis.R" takes the average values for each variable conditioned on subject and activity separately, placing this data in a new data set. The script adds a label to each row signifying whether the averages were calculated for a subject or an activity. This data set is then output as a .txt file with row names removed. 

