# to do
# create loop for differing number of k
# create correct scaling for min put vs age
# create loop for reading test data and writing results to matrix

# create training dataset
train <- read.table("C:/Test/Min Put kNN Analysis - Training.csv",header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE);

# input age, minimum putamen, and k
input_age<-77
input_put<-.53
k<-3

# age and putamen scale factors
age_scale<-1
put_scale<-20

# scale age and put
input_put_scaled<-input_put*put_scale
input_age_scaled<-input_age*age_scale
train<-within(train,put_scaled<-with(train,Min.Putamen*put_scale))
train<-within(train,age_scaled<-with(train,Age.at.Screening*age_scale))

# calculate distance between input point and all other dataset points
train<-within(train,dist<-sqrt(with(train,input_age-Age.at.Screening)^2+with(train,input_put_scaled-put_scaled)^2))

# select record from dataset with minimum distance to input
subset(train,rank(train$dist)==1)
subset(train,rank(train$dist)==2)
subset(train,rank(train$dist)==3)

# select cohort from dataset with minimum distance to input
# train$Subject.Cohort[train$dist==min(train$dist)] # old way
result<-c(train$Subject.Cohort[rank(train$dist)==1],
train$Subject.Cohort[rank(train$dist)==2],
train$Subject.Cohort[rank(train$dist)==3])
result

train$Subject.Cohort[rank(train$dist)==1]
train$Subject.Cohort[rank(train$dist)==2]
train$Subject.Cohort[rank(train$dist)==3]
