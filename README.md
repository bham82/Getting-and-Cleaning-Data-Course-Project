## Getting and Cleaning Data - Course Project

Description
    
    This repo contains all the required materials for the Course Project of Couersera's Getting 
    and Cleaning Data session 10.
    
Included Files

    run_analysis.R - R script to perform all required data cleaning and produce a tidy dataset.
    Summary_Variable_Averages.txt - Tidy dataset resulting from run_analysis.R
    CodeBook.md - Descriptions of all variables in Summary_Variable_Averages.txt.
    
## Description of run_analysis

Overview

    All analysis and data cleansing is completed by the run_analysis.R script.  The script assumes 
    the working directory contains the tran and test directories containing the data provided for 
    this project.  Using this data along with the "activity_labels.txt" and "features.txt" files 
    this script creates the tidy dataset "Summary_Variable_Averages.txt"

Step 1 - Combine Train and Test Data

    First the run_analysis script reads in the 6 train and test datasets, and combines the three 
    datasets for each by column (horizontally) to create a single data frame.  These combined test
    and train data frames are then combined rows (vertically) to create a complete data frame.
    
Step 2 - Select Meand and Standard Deviation Measures

    Next the "features.txt" file was read in and used to select only columns containing "mean" 
    or "std" using grep from the combined train and test data frame.
    
Step 3 - Add Descriptive Activity Labels

    After the appropriate columns, the "activity_labels.txt" file was read in and merged with the 
    complete data frame to provide descriptitve activity labels.
    
Step 4 - Label the Dataset

    Now that the dataset contains all necessary columns, the "features.txt" file is read in to 
    get the original measure names.  Because these measures include some illegal characters for
    R columns like parenthesis, commas, and dashes, these are removed.  Next the leading "t" or 
    "f" are replaced by either "Time." or "Freq." to better describe the domain of the measure.  
    Finally, camel casing is applied to the column names, and a small error of the "Body" being 
    duplicated in some columns is removed.  
    
Step 5 - Create Summarized Tidy Dataset

    Next ddply of the plyr package is used to create the summarized tidy dataset, by calculating 
    the column means for all measures by subject and activity.  This was done by concatenating 
    the subject and activity columns, performing the summary, and then splitting the values back 
    into seperate columns.  Finally the column names are reapplied to the summarized dataset.
    
Final Step

    The final step to this analysis was to write out the summarized tidy dataset to a text file
    using the write.table command.
    
    write.table(Summary.Results, "Summary_Variable_Averages.txt", row.names=FALSE)
    
    If this dataset needs to be read in use the following command.
    
    Summary.Results.In <- read.table("Summary_Variable_Averages.txt", header=TRUE)
    
