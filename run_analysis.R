run_analysis <-function(df) {
        
        ## This function will perform the following:
        ## 1. Combine the x_train and x_test files and add the appropriate subject_train and y_test and y_train columns
        ## 2.  Extract acceleration(body+gravity) and gyro measurements to create a subset
        ## 3.  Add a activity descriptive names for each record
        ## 4.  Label each column with appropriate variable names
        ## 5.  Create a tidy data sets with the average of measurements and write to a text file.
        
        
        ##1. Combine the x_train and x_test files add appropriate columns
        
        ##Ensure i am in the proper working directory where data is located
        WD<-getwd()
        subDirectory<-"/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset"
        WorkingDirectory <- paste(WD,subDirectory,sep="")  
        setwd(WorkingDirectory)

        
        ##1a. Read x_train, y_train, subject_train
        setwd(paste(getwd(),"/train",sep=""))
        x_train.df = read.table("X_train.txt")        
        y_train.df = read.table("y_train.txt")
        subject_train.df = read.table("subject_train.txt")
        
        ##1b. Combine subject train and y train by adding themat end of x_train data frame (y_train.txt first, then subject_train.txt).
        x_train.df<-cbind(x_train.df,y_train.df,subject_train.df)
        
        ##1c. Read x_test, y_test, subject_test
        setwd("../")
        setwd(paste(getwd(),"/test",sep=""))
        x_test.df = read.table("X_test.txt")        
        y_test.df = read.table("y_test.txt")
        subject_test.df = read.table("subject_test.txt")
        
        ##1d. Combine subject test and y test by adding themat end of x_test data frame (y_test.txt first, then subject_text.txt).
        x_test.df<-cbind(x_test.df,y_test.df,subject_test.df)
        ##r<-x_train.df
        
        ##1e Combine x_train.df and x_test.df by putting x_test at end of x_train rows
        x_train_test.df <- rbind(x_train.df,x_test.df)
        
 ##----------------------------------------------------
        ##2   Extract acceleration(body+gravity) and gyro measurements to create a subset
        ##    The requirement is to extract only the measurements on the mean and standard deviations. 
        ##    Only the accelerations and the gyroscope were measured using the phone, all other variables are calculated or derived.
        ##    Therefore, I extract the Accelerations (body + gravity) and gyro measurements on the time domain only.
        ##    Upon observation of the features.txt file, these elements correspond to the following
        ##    elements: [1,2,3,4,5,6,41,42,43,44,45,46,240,241] of the features.txt file
         
        ## 2a Read in features.txt file and extract vector of desired measurements for mean and std 
        
         setwd("../")
         features.df = read.table("features.txt") 
         feature_vector <-c(1:6,41:46,240:241)
         sub_features <- features.df[feature_vector,]
        
        ## 2b create a subset data frame with only relevant measurements, adding subject and activity columns
         
        x_train_test_sub.df <-x_train_test.df[,c(feature_vector,562:563)]
         
        
        ## 3 Add descriptive activity names to name activities in data set
        ##   I will add a column with the corresponding activity names (I do not want to overwrite the original data)
        
        Activity_names.df = read.table("activity_labels.txt",stringsAsFactors = FALSE) 
        ## add a column to data frame containing data
        
        newcol <-c("Activity_Name")
        x_train_test_sub.df[,newcol]<-NA
        
        ## adding activity names in text to each row in new column
 
        for (n in 1:nrow(x_train_test_sub.df)) {
                if(x_train_test_sub.df[n,15]=="1") x_train_test_sub.df[n,17]<- Activity_names.df[1,2]
                if(x_train_test_sub.df[n,15]=="2") x_train_test_sub.df[n,17]<- Activity_names.df[2,2]
                if(x_train_test_sub.df[n,15]=="3") x_train_test_sub.df[n,17]<- Activity_names.df[3,2]
                if(x_train_test_sub.df[n,15]=="4") x_train_test_sub.df[n,17]<- Activity_names.df[4,2]
                if(x_train_test_sub.df[n,15]=="5") x_train_test_sub.df[n,17]<- Activity_names.df[5,2]
                if(x_train_test_sub.df[n,15]=="6") x_train_test_sub.df[n,17]<- Activity_names.df[6,2]
        }
 
 
        ## 4.  Label data set with descriptive variable names by creating a name vector with appropriate names and saving in 
        ## dataframe column header.Remove parentheses and minus signs in labels to ensure not confuse ddlyr function.
        col_names_temp <- as.character(sub_features[[2]])
        col_labels <- as.character(c(col_names_temp,"Activity_Integer", "Subject", "Activity_Name"))
        col_labels<-gsub("\\()", "", col_labels)
        col_labels<-gsub("-", "", col_labels)
        colnames(x_train_test_sub.df) <- col_labels
        
 
        ##5. Create a second tidy dataset with the average of each variable for each activity
        ##   and each subject
 
 
        Q5.Tidy.df<- ddply(x_train_test_sub.df,c("Subject","Activity_Name"), summarise, tBodyAccmeanX=mean(tBodyAccmeanX),tBodyAccmeanY=mean(tBodyAccmeanY),tBodyAccmeanZ=mean(tBodyAccmeanZ),tBodyAccstdX=mean(tBodyAccstdX),tBodyAccstdY=mean(tBodyAccstdY),tBodyAccstdZ=mean(tBodyAccstdZ),tGravityAccmeanX=mean(tGravityAccmeanX),tGravityAccmeanY=mean(tGravityAccmeanY),tGravityAccmeanZ=mean(tGravityAccmeanZ),tGravityAccstdX=mean(tGravityAccstdX),tGravityAccstdY=mean(tGravityAccstdY),tGravityAccstdZ=mean(tGravityAccstdZ),tBodyGyroMagmean=mean(tBodyGyroMagmean),tBodyGyroMagstd=mean(tBodyGyroMagstd))
        
        ##5a. write to a text file in the working directory where run_Analysis.R can be found.
        setwd("../")
        setwd("../")
        write.table(Q5.Tidy.df, "Q5_Tidy.txt",row.names=FALSE)
 run_analysis <- x_train_test_sub.df
 
        
}