#1. Use the given link and locate the bank marketing dataset. Data Set Link
#Perform the below operations:
# a. Create a visual for representing missing values in the dataset.
# using dataset airquality to create a visual for representing missing values in the dataset
data1 = airquality

dim(data1)
str(data1)
summary(newair)

hist(data1$Ozone ,xlab = "ozone", ylab = "frequency",main="histogram of ozone",col="blue")

median(data1$Ozone)
median(data1$Ozone,na.rm = T)

#imputing the variable ozone with the median

data1$Ozone[is.na(data1$Ozone)]<- median(data1$Ozone,na.rm = T)


summary(newair)
data1$Ozone

#visualize after imputing the variable ozone with the median

hist(data1$Ozone ,xlab = "ozone", ylab = "frequency",main="histogram of ozone",col="blue")

#b. Show a distribution of clients based on a Job.

unzip('bank.zip')
d = read.csv('bank.csv',sep = ";")
View(d)

#Client column not present in bank data set hence used education

library(ggplot2)
ggplot(d, aes(x=job, y=education, fill=job)) + 
  geom_boxplot(alpha=0.3) +
  theme(legend.position="none")+
  ggtitle("Distribution of education based on a Job")



#c. Check whether is there any relation between Job and Marital Status?

#we are using Chi-Square Test for checking relation as both job and marital status are categorical variables
#so first defining the null hypothesis


chisq.test(d$job ,d$marital)


#p value<0.05 hence we will reject the null hypo and accept the alternative hypothesis
#which says that There is relation between job and marital status

#d. Check whether is there any association between Job and Education?


chisq.test(d$job ,d$education)


#p value<0.05 hence we will reject the null hypo and accept the alternative hypothesis
#which says that There is association between job and education