###################
# Part 0: Getting #
###################

if (!file.exists("dataset.zip"))
{
   file.URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
   download.file(fileURL, destfile="dataset.zip", method="curl")
   date.Downloaded <- date()
}

if (!file.exists("UCI HAR Dataset"))
{
   unzip("dataset.zip")
}

setwd("UCI HAR Dataset")

#################
# Part 1: Merge #
#################

test.set <- read.table("test/subject_test.txt", col.names=c("subject"))
train.set <- read.table("train/subject_train.txt", col.names=c("subject"))
subj <- rbind(train.set, test.set)

test.X <- read.table("test/X_test.txt")
train.X <- read.table("train/X_train.txt")
test.y <- read.table("test/y_test.txt", col.names=c("activityid"))
train.y <- read.table("train/y_train.txt", col.names=c("activityid"))
X <- rbind(test.X, train.X)
y <- rbind(test.y, train.y)

###################
# Part 2: Extract #
###################

feature <- read.table("features.txt", col.names=c("featureid", "featurename"))
idx <- grep("-mean\\(\\)|-std\\(\\)", feature$featurename)
names(X) <- feature[, 2]
msd <- X[, idx]

################
# Part 3: Name #
################

act <- read.table("activity_labels.txt", col.names=c("activityid", "activity"))
act[, 2] <- gsub("_", "", as.character(act[, 2]))
y[, 1] <- act[y[, 1], 2]
names(y) <- "activity"

######################
# Part 4: Name again #
######################

tidyData <- cbind(subj, y, msd)
names(tidyData)[2] <- paste("activity")
names(tidyData) <- gsub("\\(|\\)", "", names(tidyData))
# write.table(tidyData,"tidyData.txt")

##########################
# Part 5: Second dataset #
##########################

library(reshape2)
mtidyData <- melt(tidyData, id=c("subject", "activity"))
subjactmean <- dcast(mtidyData, subject + activity ~ variable, mean)
View(subjactmean)
write.csv(subjactmean, file="tidyData.txt", row.names=FALSE)
