This is a course project for the Getting and Cleaning Data Coursera course.

The R script, run_analysis.R, does the following:

1 Download the dataset if it does not already exist in working directory.

2 Load the activity and feature information.

3 Load both the Training and Test datasets, kepping only those columns which reflect a mean or standard deviation.

4 Loads the activity and subject datasets, and merge those columns with the dataset.

5 Merges the two datasets.

6 Converts the activity and subject column into factors.

7 Create the tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.


The end result is in file tidy.txt coursera-getting--and-cleaning-data.

