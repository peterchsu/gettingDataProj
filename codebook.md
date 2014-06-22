CodeBook for output of run_analysis()
========================================================

This codebook is for the output of the run_analysis() script, which is stored as the AverageOfFeatures.txt file.  See the readme for a description of the original activities performed.

<h2>Data descriptions for standard (wide) output</h2>
SubjectID - a unique numerical identifier for the subject who performed the activity.

dataFeature - a character string describing the ativity being performed.  These are "R friendly" versions of the original UCI HAR data feature names.

WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING - These column names indicate the activity being performed by the subject.  This is the average of the readings for the specified data feature.  In the sourcce data set, features have been normalized by dividing by their range and are bounded within [-1,1].  Accordigly there are no "unit".

<h2>Data description for narrow output</h2>
SubjectID - a unique numerical identifier for the subject who performed the activity.

dataFeature - a character string describing the ativity being performed.  These are "R friendly" versions of the original UCI HAR data feature names.

Activity - the activity column names from the above version.

Average - the average of readings for the data feature (these are the values from the above "Wide" data set).

<h2>Output of "first" data set</h2>
The "first" data set is a subset of the original UCI HAR dataset, with the following modifications performed:
- Merged the training and the test sets to create one data set.
- Extracted only the measurements on the mean and standard deviation for each measurement. 
- Used descriptive activity names to name the activities in the data set
- Appropriately labeled the data set with descriptive variable names.