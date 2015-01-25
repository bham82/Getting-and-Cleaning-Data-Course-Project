require(plyr) ## Required for Step 5 use of ddply

#########################################################################
## Step 1 - Combine Train and Test data
#########################################################################

## Read in Train data
subject_train <- read.table("./train/subject_train.txt")
x_train <- read.table("./train/x_train.txt")
y_train <- read.table("./train/y_train.txt")

## Read in Test data
subject_test <- read.table("./test/subject_test.txt")
x_test <- read.table("./test/x_test.txt")
y_test <- read.table("./test/y_test.txt")

## Combine Train data horizontally
train <- cbind(subject_train, y_train, x_train)

## Combine Test data horizontally
test <- cbind(subject_test, y_test, x_test)

## Combine Train and Test data vertically
train_test_combine <- rbind(train, test)

#########################################################################
## Step 2 - Extract only measurements of mean 
##          and std dev for each mesurement
#########################################################################

## Read in features table
features <- read.table("./features.txt",stringsAsFactors=FALSE)

## Add Subject Number and Training Label values
features <- rbind(c(0,"Subject.Number")
                  ,c(0,"Activity.Number")
                  ,features)

## Create boolean vector for mean and std column names
features$column_select <- (grepl("mean",features$V2,ignore.case=TRUE) 
                          | grepl("std",features$V2,ignore.case=TRUE))

## Set boolean vector values for Subject.Number and Activity.Number to TRUE
## so they are included in the dataframe for summary later.
features$column_select[1:2] <- TRUE

## Use boolean vector select only mean and std columns
combine_col_filter <- train_test_combine[,features$column_select]

#########################################################################
## Step 3 - Uses descriptive activity names to name 
##          the activities in the data set
#########################################################################

## Read in Activity descriptions
activity.labels <- read.table("./activity_labels.txt",stringsAsFactors=FALSE)

## Merge combine dataframe with Activity descriptions
combine_act_desc <- merge(x = combine_col_filter
                          ,y = activity.labels
                          ,by.x="V1.1"
                          ,by.y="V1"
                          ,all.x=TRUE)

## Reorder the columns so Subject.Number, Activity.Number,
##  and Activity.Description are the first three columns
combine_act_desc <- cbind(combine_act_desc$V1
                          ,combine_act_desc$V1.1
                          ,combine_act_desc$V2.y
                          ,combine_act_desc[-c(1,2,89)])

## Add Activity.Description to the features dataframe
features <- rbind(features[1:2,]
                  ,c(0,"Activity.Description",TRUE)
                  ,features[-c(1,2),])

## Convert column_select back to a logical for later use
features$column_select <- as.logical(features$column_select)

#########################################################################
## Step 4 - Appropriately labels the data set 
##          with descriptive variable names. 
#########################################################################

## Remove parenthesis
features$column_names <- gsub("\\)","",gsub("\\(","",features$V2))

## Replace commas with periods
features$column_names <- gsub(",",".",features$column_names)

## Replace dashes with periods
features$column_names <- gsub("-",".",features$column_names)

## Replace starting t with Time.
features$column_names <- gsub("^t","Time.",features$column_names)

## Replace starting f with Freq.
features$column_names <- gsub("^f","Freq.",features$column_names)

## Replace starting angleT with Angle.Time.
features$column_names <- gsub("^anglet","Angle.Time.",features$column_names)

## Replace starting angle with Angle.
features$column_names <- gsub("^angle","Angle.",features$column_names)

## Function to upper case every character after a period
## Ref: Modified version of .simpleCap function in R toupper help page
CapAfterPeriod <- function(x) {
  s <- strsplit(x, "\\.")[[1]]
  paste(toupper(substring(s, 1, 1)), substring(s, 2), sep = "", collapse = ".")
}

## Apply upper case function to column name data frame
features$column_names <- sapply(features$column_names,CapAfterPeriod,simplify="array")

## Replace BodyBody with a single Body
features$column_names <- gsub("BodyBody","Body",features$column_names)

## Apply modified column names to the dataframe
names(combine_act_desc) <- t(features$column_names[features$column_select])

#########################################################################
## Step 5 - From the data set in step 4, creates a second, 
##          independent tidy data set with the average of each 
##          variable for each activity and each subject.
#########################################################################

## Concatenate Subject.Number, Activity.Number, and Activity.Description
## seperated by a "." to be split up later
Group <- as.factor(paste(combine_act_desc$Subject.Number
                         ,combine_act_desc$Activity.Number
                         ,combine_act_desc$Activity.Description
                         ,sep="."))

## Combine new Group vector to original data frame minus the 3 columns
Data.for.Summary <- cbind(Group, combine_act_desc[,4:ncol(combine_act_desc)])

## Create mean summaries for each measure column
Summary.by.Subject.Activity <- ddply(Data.for.Summary, .(Group), colwise(mean))

## Split Subject and Activity columns by "."
Split.Subject.Activity <- unlist(strsplit(as.character(Summary.by.Subject.Activity$Group),"\\."))

## Combine Subject and Activity columns with the calculated means
Summary.Results <- cbind(data.frame(matrix(Split.Subject.Activity, ncol=3, byrow=TRUE))
                         ,Summary.by.Subject.Activity[,-1])

## Reapply the column names
names(Summary.Results) <- t(features$column_names[features$column_select])

#########################################################################
## Final Step 
## Create txt file of final dataset to be uploaded to Coursera
##
## Please upload your data set as a txt file 
## created with write.table() using row.name=FALSE
#########################################################################

## Write text file for submission
write.table(Summary.Results, "Summary_Variable_Averages.txt", row.names=FALSE)

## Example read statement for dataset
Summary.Results.In <- read.table("Summary_Variable_Averages.txt", header=TRUE)




