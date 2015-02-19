# GettingAndCleaningDataProject
Instructions on how the script works: 

1. The script run_analysis.R needs to be put in your working directory. This directory has to be the working directory.
2. In this directory, you will have the "getdata-projectfiles-UCI HAR Dataset folder and sub-folders as per original zipped file.
3. The script file can be run by calling it from console: run_analysis(). There are no variables to be passed to the function.
4. The output of the function will produce a txt file named Q5.Tidy.txt.
5. The Q5.Tidy.txt file will be saved in the same location as where the run_analysis file can be found.

Notes on the analysis:

1. The requirement is to extract only the measurements on the mean and standard deviations. Only the accelerations and 
   the gyroscope were measured using the phone, all other variables are calculated or derived. Therefore, I extracted the
   accelerations (body + gravity) and gyro measurements on the time domain only. 

2. The resulting table that is exported as part of question 5 had 16 columns of data, including the subject and activity type. 

3. Each column was averaged over all original data samples, and summerized per subject and activity.

4. The table of this summarized data is exported. There are 180 rows of data (30 subject x 6 activity per subject) in addition to one header row.
  
