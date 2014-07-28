# Coursera and John Hopkins University:
# Getting and Cleaning Data
## Course Project
### README

__This README contains instructions for running the setting up the working
environment and running the analysis script.__

Contents:

* README.md (this file)
* CodeBook.md that describes the and work done to clean the data
* run_analysis.R is the analysis script for doing the work of cleaning and 
summarising the data

This course project is concerned with cleaning data that was collected from a
number of subjects who were wearing smartphones while performing various
physical activities. The script described here cleans and summarises the data.

From the codebook accompanying the raw data:

----

The experiments have been carried out with a group of 30 volunteers within an 
age bracket of 19-48 years. Each person performed six activities (WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer 
and gyroscope, we captured 3-axial linear acceleration and 3-axial angular 
velocity at a constant rate of 50Hz. The experiments have been video-recorded to
label the data manually. The obtained dataset has been randomly partitioned into
two sets, where 70% of the volunteers was selected for generating the training 
data and 30% the test data.

----

It is assumed that the dataset has already been downloaded to the working
directory; that is, the same directory in which this README and the analysis
script run_analysis.R reside. No doubt I could have figured out how to get R
to download and unzip the dataset, but the assignment does not ask for that.
No need to make the course project more complicated. But just to be safe, the
script check that this first step had been done.

Load the script with this command:
`source("run_analysis.R")`

Run the analysis with this command:
`run_analysis()`

_Please refer to the accompanying CodeBook file for details on what the analysis script does._

