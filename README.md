run_analysis()
========================================================

This function takes the UCI HAR dataset, and combines the test and training data.  The function then returns an average of average and standard deviation features broken out by subject and activity.  The remaining features are discarded.

This function takes as input the UCI Human Activity Recognition Using Smartphones Data Set, described at this website:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The script assumes the data has been downloaded to the working directory.

<h2>Input variables (all are optional)</h2>
writeFirstDataSet - an initial "transient" data set is created. If this variable is set to TRUE, this data set will be writen to the current directory rather than simply disappearing into the ether

writeSecondDataSet - write the averages to file?

formatWide - format as wide data vs narrow data?

<h2>About wide format</h2>
If the data set is returned in the "wide" format, it will have the data features as column names for easy selecting.  If it is writen in the narrow format, it will have data features as another column.

<h2>Original experiment description</h2>
The following is the original experiment description from the UCI HAR dataset:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Clearly for the purposes of this function, the entire 561 feature vector is not returned.  Rather, as mentioned, only the mean and standard deviation features are used.  For each of these an average value is calculated for each activity performed by each subject, which is the value returned.

The dataset requires the following attribution:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012