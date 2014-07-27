run_analysis <- function() {
  
  # Check that dataset exists in present working directory
  if(!file.exists("UCI HAR Dataset")) {
    print("Dataset does not exist in this directory!")
    print("Download the dataset to this directory and unzip its contents here.")
    
  }
  else {
    print("Dataset found in this directory. Continuing...")
    setwd("UCI HAR Dataset")
    
    # Let's get hold of the data and made data frames for each
    
    # First the data in the top directory...
    activity_labels<-read.table("activity_labels.txt", sep=" ", header=FALSE)
    features<-read.table("features.txt", sep=" ", header=FALSE)
    
    # Move into test directory...
    setwd("./test")
    subject_test<-read.table("subject_test.txt", header=FALSE)
    X_test<-read.table("X_test.txt", strip.white=TRUE, header=FALSE)
    y_test<-read.table("y_test.txt", sep=" ", header=FALSE)
    
    # Move into train directory...
    setwd("../train")
    subject_train<-read.table("subject_train.txt", header=FALSE)
    X_train<-read.table("X_train.txt", strip.white=TRUE, header=FALSE)
    y_train<-read.table("y_train.txt", sep=" ", header=FALSE)
    
    # Combine the numeric measurements of the train and test data
    data_combined<-rbind(X_train,X_test)
    
    # Name the columns with the feature names
    colnames(data_combined)<-as.character(features[,2])
    
    # Combine the train and test data for the subject field
    subject<-rbind(subject_train,subject_test)
    
    # Name the subject column
    colnames(subject)<-c("Subject")
    
    # Combine the train and test data for the activity field
    activity<-rbind(y_train,y_test)
    
    # Name the activity column
    colnames(activity)<-c("Activity")
    
    thetable<-cbind(data_combined,subject,activity)
    
    # Paste on an extra column with descriptive names for activities
    thetable$ActivityNames<-activity_labels[thetable$Activity,2]
    
    # Go to main working directory
    setwd("../../")
    
    # Create a vector of indices for the columns containing means of measurements
    mean_indices<-grep("mean",colnames(thetable), ignore.case=TRUE)
    
    # Create a vector of indices for the columns containing std's of measurements
    std_indices<-grep("std",colnames(thetable), ignore.case=TRUE)
    
    # Concatenate and sort
    all_indices<-sort(c(mean_indices,std_indices))
    
    # Step 2 of the exercise says that we want only the means and std's;
    # Extract just these columns, then paste on the subject and activity columns
    Subject<-thetable$Subject
    Activity<-thetable$ActivityNames
    tidy_data<-cbind(thetable[,all_indices], Subject, Activity)
    # End of step 2
    
    # Step 5
    # Summary statistics (means) calculated by Activity and Subject:
    final_tidy_data<-aggregate(tidy_data[1:86], by=list(Activity,Subject), FUN=mean, na.rm=TRUE)
    colnames(final_tidy_data)[1]<-"Activity"
    colnames(final_tidy_data)[2]<-"Subject"
    
    # All steps done!
    
    # Write data
    write.csv(final_tidy_data, file="tidydata.csv", row.names=FALSE)

    print("Done!")
  }
}