#CodeBook

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

Data Preparation
========

The data was patitioned in a training and a test data set. Either consisting of measurements, activities and subjects.

Following steps were performed:

(1) import raw data
(2) combining test and training data sets
(3) assembling whole data set (subject, activity, measurements)
(4) renaming variables using the features.txt
(5) subsetting all columns containing "mean" and "std" of taken *measurements* as well as subject and activity. magnitude and time derived data was excluded as it is no "mean and standard deviation for each measurement".
(6) introducing speaking activity names using the activity labels provided.
(7) altering variable names for easier reading by removing "-" and "()" and introducing camelCase

The result is the data set "data".


To create a tidy summary data set the data was grouped by subject and activity and for each measurement the mean was calculated. Result is the data set "data_summary".

Description of variables
========
##subject         
tBodyAccMeanX    
tBodyAccMeanY    
tBodyAccMeanZ   
tBodyAccStdX     
tBodyAccStdY     
tBodyAccStdZ     
tGravityAccMeanX
tGravityAccMeanY 
tGravityAccMeanZ 
tGravityAccStdX  
tGravityAccStdY 
tGravityAccStdZ  
tBodyGyroMeanX   
tBodyGyroMeanY   
tBodyGyroMeanZ  
tBodyGyroStdX    
tBodyGyroStdY    
tBodyGyroStdZ    
fBodyAccMeanX   
fBodyAccMeanY    
fBodyAccMeanZ    
fBodyAccStdX     
fBodyAccStdY    
fBodyAccStdZ     
fBodyGyroMeanX   
fBodyGyroMeanY   
fBodyGyroMeanZ  
fBodyGyroStdX    
fBodyGyroStdY    
fBodyGyroStdZ    
activity



