# GettingAndCleaningDataProject
Instructions on how the script works: 

1. The script run_analysis.R needs to be put in your working directory. This directory has to be the working directory.
2. In this directory, you will have the "getdata-projectfiles-UCI HAR Dataset folder and sub-folders as per original zipped file.
3. The script file can be run by calling it from console: run_analysis(). There are no variables to be passed to the function.
4. The output of the function will produce a txt file named Q5.Tidy.txt.
5. The Q5.Tidy.txt file will be saved in the same location as where the run_analysis file can be found.

Assumptions used for the project:
1. The requirement is to extract only the measurements on the mean and standard deviations. Only the accelerations and 
   the gyroscope were measured using the phone, all other variables are calculated or derived. Therefore, I extracted the
   accelerations (body + gravity) and gyro measurements on the time domain only. 
  
