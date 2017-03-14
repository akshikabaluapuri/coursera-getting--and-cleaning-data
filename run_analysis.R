library(dplyr)
library(reshape2)

if(!file.exists(".//tidyfile")){
  dir.create(".//tidyfile")}


dwUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dwUrl, destfile = ".//tidyfile/tidyclean.zip")
unzip(zipfile = "tidyfile/tidyclean.zip", exdir = "./tidyfile")

UCI_data <- file.path("./tidyfile","UCI HAR dataset")

f_list <- list.files(UCI_data, recursive = TRUE)


act_label <- read.table(file.path(UCI_data,"activity_labels.txt"), header = FALSE)
colnames(act_label) <-  c("y_id", "y_type")
act_label<- as.character(act_label$y_type)

feature_label <- read.table(file.path(UCI_data, "features.txt"), header = FALSE)
colnames(feature_label) <-  c("x_id", "x_type")
feature_label1 <- as.character(feature_label$x_type)
feature_want <- feature_label1[grep(".*mean.*|.*std.*",feature_label1)]


Train_y <- read.table(file.path(UCI_data,"train", "y_train.txt"), header = FALSE)
Test_y <- read.table(file.path(UCI_data,"test", "y_test.txt"), header = FALSE)

Train_s <- read.table(file.path(UCI_data,"train", "subject_train.txt"), header = FALSE)
Test_s <- read.table(file.path(UCI_data,"test", "subject_test.txt"), header = FALSE)

Train_x <- read.table(file.path(UCI_data,"train", "X_train.txt"), header = FALSE)
Test_x <- read.table(file.path(UCI_data,"test", "X_test.txt"), header = FALSE)


activity_data <- rbind(Train_y, Test_y)
subject_data <- rbind(Train_s, Test_s)
feature_data <- rbind(Train_x, Test_x)

colnames(subject_data) <- "Subject"
colnames(activity_data) <-"Activity"
colnames(feature_data) <- as.character(feature_want)



data <- cbind(subject_data,activity_data, feature_data)

activity_data$Activity <- factor(activity_data$Activity, labels = as.character(act_label))
subject_data$Subject <- as.factor(subject_data$Subject)

ddata <- melt(data, id = c("Subject", "Activity"))
ddata.mean <- dcast(ddata, Subject+Activity ~ variable, mean)

#write.table(ddata.mean, file = "text.txt", row.names = FALSE, col.names = TRUE, sep = ",")

View(ddata.mean)








