Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw time domain signals timeacelerometer-XYZ and timegyroscope-XYZ.

Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tbodyaccelerometer-XYZ and tgravityaccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain jerk signals (tbodyaccelerometerjerk-XYZ and tbodygyroscopejerk-XYZ).

Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tbodyaccelerometermagnitude, tgravityaccelerometermagnitude, tbodyaccelerometerjerkmagnitude, tbodygyroscopemagnitude, tbodygyroscopejerkmagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fbodyaccelerometer-XYZ, fbodyaccelerometerjerk-XYZ, fbodygyroscope-XYZ, fbodyaccelerometerjerkmagnitude, fbodygyroscopemagnitude, fbodygyroscopejerkmagnitude. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

timebodyaccelerometer-XYZ
timegravityaccelerometer-XYZ
timebodyaccelerometerjerk-XYZ
timebodygyroscope-XYZ
timebodygyroscopejerk-XYZ
timebodyaccelerometermagnitude
timegravityaccelerometermagnitude
timebodyaccelerometerjerkmagnitude
timebodygyroscopemagnitude
timebodygyroscopejerkmagnitude
freqbodyaccelerometer-XYZ
freqbodyaccelerometerjerk-XYZ
freqbodygyroscope-XYZ
freqbodyaccelerometermagnitude
freqbodyaccelerometerjerkmagnitude
freqbodygyroscopemagnitude
freqbodygyroscopejerkmagnitude

The set of variables that were estimated from these signals are: 

mean: mean value
std: Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravitymean
tbodyAccmean
tbodyAccjerkmean
tbodyGyromean
tbodyGyrojerkmean

Additionally, activity, subject and label, indicates the activity index, the subject index and the activity description respectively.

The signals are represented in the file 'study.txt'. Meanwhile, each activity signal mean can be found in 'activities.txt'.