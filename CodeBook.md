---
title: "CodeBook"
output: html_document
---

Data Dictionary - Summarized Tidy Dataset

Subject.Number
    
    Identifier of each Subject for the test.  Ranges from 1 - 30.

Activity.Number
    
    Identifier of each activity type performed.  Ranges 1-6.  (Text description for 
    each in Activity.Description column)
	
Activity.Description
    
    Text description of the Activity.Number.
	
		Activity.Number - Activity.Description
		1 - WALKING
		2 - WALKING_UPSTAIRS
		3 - WALKING_DOWNSTAIRS
		4 - SITTING
		5 - STANDING
		6 - LAYING

Measure Columns  
  
    The remaining columns are the mean of measure values found in the original dataset.
  	Per the project instructions all measures including the terms Mean or Std were selected,
  	and the mean value found per Subject and Activity.	

Measure Naming Standard
	
    All measures start with Time. or Freq. to identify if the measure is in the Time 
    or Frequency domain.  Next is the type of measurement (ex - BodyAcc.Mean) followed by 
    the axis in which it was measured X, Y, or Z (if applicable).

Measure Units

  	Because all measures are the mean of normalized variables they are all unit less and range [-1,1].

Measure Column Names

    Time.BodyAcc.Mean.X
    Time.BodyAcc.Mean.Y
    Time.BodyAcc.Mean.Z
    Time.BodyAcc.Std.X
    Time.BodyAcc.Std.Y
    Time.BodyAcc.Std.Z
    Time.GravityAcc.Mean.X
    Time.GravityAcc.Mean.Y
    Time.GravityAcc.Mean.Z
    Time.GravityAcc.Std.X
    Time.GravityAcc.Std.Y
    Time.GravityAcc.Std.Z
    Time.BodyAccJerk.Mean.X
    Time.BodyAccJerk.Mean.Y
    Time.BodyAccJerk.Mean.Z
    Time.BodyAccJerk.Std.X
    Time.BodyAccJerk.Std.Y
    Time.BodyAccJerk.Std.Z
    Time.BodyGyro.Mean.X
    Time.BodyGyro.Mean.Y
    Time.BodyGyro.Mean.Z
    Time.BodyGyro.Std.X
    Time.BodyGyro.Std.Y
    Time.BodyGyro.Std.Z
    Time.BodyGyroJerk.Mean.X
    Time.BodyGyroJerk.Mean.Y
    Time.BodyGyroJerk.Mean.Z
    Time.BodyGyroJerk.Std.X
    Time.BodyGyroJerk.Std.Y
    Time.BodyGyroJerk.Std.Z
    Time.BodyAccMag.Mean
    Time.BodyAccMag.Std
    Time.GravityAccMag.Mean
    Time.GravityAccMag.Std
    Time.BodyAccJerkMag.Mean
    Time.BodyAccJerkMag.Std
    Time.BodyGyroMag.Mean
    Time.BodyGyroMag.Std
    Time.BodyGyroJerkMag.Mean
    Time.BodyGyroJerkMag.Std
    Freq.BodyAcc.Mean.X
    Freq.BodyAcc.Mean.Y
    Freq.BodyAcc.Mean.Z
    Freq.BodyAcc.Std.X
    Freq.BodyAcc.Std.Y
    Freq.BodyAcc.Std.Z
    Freq.BodyAcc.MeanFreq.X
    Freq.BodyAcc.MeanFreq.Y
    Freq.BodyAcc.MeanFreq.Z
    Freq.BodyAccJerk.Mean.X
    Freq.BodyAccJerk.Mean.Y
    Freq.BodyAccJerk.Mean.Z
    Freq.BodyAccJerk.Std.X
    Freq.BodyAccJerk.Std.Y
    Freq.BodyAccJerk.Std.Z
    Freq.BodyAccJerk.MeanFreq.X
    Freq.BodyAccJerk.MeanFreq.Y
    Freq.BodyAccJerk.MeanFreq.Z
    Freq.BodyGyro.Mean.X
    Freq.BodyGyro.Mean.Y
    Freq.BodyGyro.Mean.Z
    Freq.BodyGyro.Std.X
    Freq.BodyGyro.Std.Y
    Freq.BodyGyro.Std.Z
    Freq.BodyGyro.MeanFreq.X
    Freq.BodyGyro.MeanFreq.Y
    Freq.BodyGyro.MeanFreq.Z
    Freq.BodyAccMag.Mean
    Freq.BodyAccMag.Std
    Freq.BodyAccMag.MeanFreq
    Freq.BodyAccJerkMag.Mean
    Freq.BodyAccJerkMag.Std
    Freq.BodyAccJerkMag.MeanFreq
    Freq.BodyGyroMag.Mean
    Freq.BodyGyroMag.Std
    Freq.BodyGyroMag.MeanFreq
    Freq.BodyGyroJerkMag.Mean
    Freq.BodyGyroJerkMag.Std
    Freq.BodyGyroJerkMag.MeanFreq
    Angle.Time.BodyAccMean.Gravity
    Angle.Time.BodyAccJerkMean.GravityMean
    Angle.Time.BodyGyroMean.GravityMean
    Angle.Time.BodyGyroJerkMean.GravityMean
    Angle.X.GravityMean
    Angle.Y.GravityMean
    Angle.Z.GravityMean
