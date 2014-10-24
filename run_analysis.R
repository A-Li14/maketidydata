

#setwd("~/Online Courses/Coursera/Data_Science_Specialization/3_Getting Data/Course Project")

#Read in measurement data; other data read in when used
dsTest <- read.table("X_test.txt")
dsTrain <- read.table("X_train.txt")


#Identify which indices in dsFeature contain measurements of mean or std
dsFeatures <- read.table("features.txt")
dsFeatures <- as.character(dsFeatures[,2])

keepMeans <- grep("mean",dsFeatures)
excludeMeanFreq <- grep("meanFreq",dsFeatures)
keepMeans <- keepMeans[!(keepMeans %in% excludeMeanFreq)]

keepstd <- grep("std",dsFeatures)
keep <- sort(append(keepMeans,keepstd))


#Subset test and training data sets prior to merging
ds <- rbind(dsTest[,keep],dsTrain[,keep])
names(ds) <- dsFeatures[keep]


#Apply activity labels
actTest <- read.table("y_test.txt")
actTrain <- read.table("y_train.txt")

actLabels <- rbind(actTest,actTrain)
actLabels <- as.factor(actLabels[,1])
levels(actLabels) <- c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")
actLabels <- data.frame(actLabels)
names(actLabels) <- "Activity"

ds$Activity <- actLabels


#Apply subject identifiers
subjectTest <- read.table("subject_test.txt")
subjectTrain <- read.table("subject_train.txt")
subjectLabs <- rbind(subjectTest,subjectTrain)
names(subjectLabs) <- "Subject #"

ds$Subject <- subjectLabs


#Create tidy data set

#Calculate mean by Subject
tidySub <- apply(ds[,1:66],2,function(x) tapply(x,ds$Subject,mean))

#Calculate mean by Activity
tidyAct <- apply(ds[,1:66],2,function(x) tapply(x,ds$Activity,mean))

tidyds <- rbind(tidySub,tidyAct)

#Add a column of factor variables to facilitate observing averages
#over subjects vs. activities
Avg.Over <- as.factor(c(rep("Subject",30),rep("Activity",6)))
tidyds <- cbind(tidyds,as.data.frame(Avg.Over))


#Output tidy data set
write.table(tidyds,"Avg_of_Combined_Data.txt",row.names = FALSE)

