run_analysis.R
DS-03 Get and Clean Data
Course Project

DEAR GRADER -- IMPORTANT NOTE
Because prior graders stated in their evaluations of my code that some segements were 'too elegant' and hard-to-follow...
...(for example: many nested functions), for this Assignment, I am specifically configuring each intermediate step...
...(example: multiple generations of 'test' and 'train' datasets each reflecting a single transformation)...
...in order to enhance readability and reduce grading complexity. While I wouldn't be so verbose in production,
...I hope it is of value to you as you evaluate this project. Thank you for your consideration.

Project Instructions:

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set. [Completed]
2. Extracts only the measurements on the mean and standard deviation for each measurement. [Completed]
3. Uses descriptive activity names to name the activities in the data set [Completed]
4. Appropriately labels the data set with descriptive variable names. [Completed]
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.[Confused as to these instructions; probably partially completed]

This project consists of one, comprehensive, R file (named: run_analysis.R)

[Almost] All of the "Project Instructions" (above) have been completed.

Additionally:
1. There is a supplemental dataset ("tidy-dataset.txt") that is intended as demonstration of completion of Step 5, above.
2. There is CODEBOOK.md, a file containing information about the tidy-dataset.

MANIFEST
run_analysis.R
tidy-dataset.txt
README.md (this file)
CODEBOOK.md

ASSUMPTION
It is assumed that the various source files provided in association with the Project are accessible under the current working directory.

STEPS
All source files were inputted.
All files were adorned with various variables and transformations (e.g., factors converted to numerics).
All source files were adorned with variable names.
As instructed, all sources files were merged and joined (e.g., rbind) to create a combined 'test' and 'train' dataset.
The fully combined dataset was reduced to only mean and std variables...and evidence printed.
The "tidy-dataset" was created and output as a txt file (then uploaded to the Assignment).


