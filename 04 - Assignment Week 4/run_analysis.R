## READ .txt data files:
labels<-read.table("activity_labels.txt")
features<-read.table("features.txt")

## TRAIN data set:
X_train<-read.table("train/X_train.txt")
Y_train<-read.table("train/y_train.txt")
S_train<-read.table("train/subject_train.txt")

## TEST data set:
X_test<-read.table("test/X_test.txt")
Y_test<-read.table("test/y_test.txt")
S_test<-read.table("test/subject_test.txt")

## MERGE datasets:
names(X_train)<-features$V2
names(S_train)<-c("subject")
names(Y_train)<-c("activity")

names(X_test)<-features$V2
names(S_test)<-c("subject")
names(Y_test)<-c("activity")

## 1.- Merges the training and the test sets to create one data set.
## Merging train dataset:
train_df<-cbind(S_train,X_train)
train_df<-cbind(train_df,Y_train)
## Merging test dataset:
test_df<-cbind(S_test,X_test)
test_df<-cbind(test_df,Y_test)
## Merging both datasets:
data_df<-rbind(train_df,test_df)
data_df<-merge(data_df,labels,by.x = "activity",by.y = "V1")
#-------------------------------------------------------------------------------------------#
## Cleaning Names of dataset:
names<-names(data_df)
names[length(names)]<-"label"
names(data_df)<-names
## 2.- Extracts only the measurements on the mean and standard deviation for each measurement.
study_df<-data_df[grepl("activity|subject|label|mean()|std()", names(data_df))]
study_df<-study_df[!grepl("meanFreq()",names(study_df))]
#-------------------------------------------------------------------------------------------#
## 4.- Appropriately labels the data set with descriptive variable names.(3 Below)
## Erase non-letter characters:
names<-gsub("-|\\()","",names(study_df))
## Time and Frequency domains:
names<-gsub("^t","time",names)
names<-gsub("^f","freq",names)
## Acceleration and Gyroscope measurements:
names<-gsub("Acc","accelerometer",names)
names<-gsub("Gyro","gyroscope",names)
## Magnitude and Jerk calculations:
names<-gsub("Mag","magnitude",names)
names<-gsub("Jerk","jerk",names)
## Body and Gravity measurements:
names<-gsub("Body","body",names)
names<-gsub("Gravity","gravity",names)
## Assign names to the dataset:
names(study_df)<-names
#-------------------------------------------------------------------------------------------#

## 3.- Uses descriptive activity names to name the activities in the data set.
## Cleaning activity labels:
study_df$label<-gsub("_"," ",tolower(study_df$label))
## Get activity datasets:
lay_df  <-study_df[grep("laying",study_df$label),]
stand_df<-study_df[grep("standing",study_df$label),]
sit_df  <-study_df[grep("sitting",study_df$label),]
down_df <-study_df[grep("downstairs",study_df$label),]
ups_df  <-study_df[grep("upstairs",study_df$label),]
walk_df <-study_df[grep("walking$",study_df$label),]

## Calculate mean for each variable and activity:
m_lay  <-lapply(lay_df[,-c(1,2,length(lay_df))],mean)
m_stand<-lapply(stand_df[,-c(1,2,length(stand_df))],mean)
m_sit  <-lapply(sit_df[,-c(1,2,length(sit_df))],mean)
m_down <-lapply(down_df[,-c(1,2,length(down_df))],mean)
m_ups  <-lapply(ups_df[,-c(1,2,length(ups_df))],mean)
m_walk <-lapply(walk_df[,-c(1,2,length(walk_df))],mean)

## 5.- From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
## Naming activities:
activity<-gsub("_"," ",tolower(labels$V2))
activity_list<-cbind(m_walk,m_ups,m_down,m_sit,m_stand,m_lay)
colnames(activity_list)<-activity
## Creating new data frame:
activity_list<-t(activity_list)
#-------------------------------------------------------------------------------------------#
write.table(study_df,"study.txt",sep=" ",row.names = FALSE)
write.table(activity_list,"activities.txt",sep=" ",row.names = TRUE)





