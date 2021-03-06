## IMPORTING DATA FROM FILES
# main function is read.table()
getwd() # identical to Bash's pwd
getwd
getwd()
getwd("~")
getwd("/home/jbde/")
setwd("~")
getwd()
setwd("Trainings/Biostats_and_R_bixcop_github/module2_R_biostats/")
setwd("~/Trainings/Biostats_and_R_bixcop_github/module2_R_biostats")
# LOADING THE DATA
read.table("fev_dataset.txt")
read.table("fev_dataset.txt") -> fev_dat
str(fev_dat)
read.table("fev_dataset.txt", header = TRUE) -> fev_dat # indicating the presence of a header row in the file
str(fev_dat)
range(fev_dat$Age) # just to get the range of ages in the dataset
range(fev_dat$Gender)
range(fev_dat$Smoke)
summary(fev_dat)
# transform the columns Gender and Smoke into factors, with levels {boy,girl} and {smoking, non-smoking}
# count the number of observations with Gender == 1
sum(fev_dat$Gender)
sum(fev_dat$Gender == 1) # same thing
nrow(fev_dat)
sum(fev_dat$Smoke)
fev_dat$Gender
?as.factor
factor(fev_dat$Gender)
tempfactor = factor(fev_dat$Gender)
levels(tempfactor)
levels(tempfactor) <- 'boy'
levels(tempfactor) <- c('girl', 'boy') # "0" becomes "girl" and "1" becomes "boy"
tempfactor
# modifying the data frame:
fev_dat$Gender = tempfactor
str(fev_dat)
tempfactor=factor(fev_dat$Smoke,levels = c("non-smoking","smoking"))
tempfactor
# the above is WRONG!
# instead, the correct way is a two-step thing:
tempfactor=factor(fev_dat$Smoke)
levels(tempfactor)
head(tempfactor)
sum(is.na(tempfactor))
# happy!
levels(tempfactor)
# cahnge the levels carefully, respecting the order!
levels(tempfactor) <- c('non-smoking','smoking')
head(tempfactor)
# finally, change the original dataset:
fev_dat$Smoke = tempfactor
str(fev_dat)
summary(fev_dat$Gender)
summary(fev_dat) # column-wise summary
# a new graphical function: scatterplots of all pairs of variables
pairs(fev_dat)
# select the numerical columns before calling pairs():
pairs(fev_dat[1:3])
pairs(fev_dat[-c(4,5)]) # same
pairs(fev_dat[c("Age","Ht","FEV")]) # same
# draw the histograms of heights of boys (blue) and girls (red) superimposed
# first have the boxplots of boys and girls, properly labeled
boxplot(Ht ~ Gender,data=fev_dat)
boxplot(Ht ~ Gender,data=fev_dat, xlab = "Gender", ylab = "Height (ft)", border = c("pink","lightblue")) # adding some ornament
?par
T
F
# wonderful short forms!!!
height_boys = fev_dat[fev_dat$Gender=="boys","Ht"]
length(height_boys)
height_boys = fev_dat[fev_dat$Gender=="boy","Ht"]
length(height_boys)
height_girls = fev_dat[fev_dat$Gender=="girl","Ht"]
hist(height_girls, border="pink")
hist(height_girls, border="pink", main="Histogram of heights", xlab = "Height")
hist(height_boys, border="lightblue", main="Histogram of heights", xlab = "Height")
# problem: we want to superimpose another graph
# by default, hist() being a first-class citizen of the world of graphical functions, it *erases* the previous plot
# we have to turn this behaviour down
par(new=T) # so that the next plot does not erase the existing one
hist(height_girls, border="pink", main="", xlab = "", ylab = "") # labels were already there
# we have no choice but to specify what are the axes limits we want
hist(height_boys, border="lightblue", main="Histogram of heights", xlab = "Height", xlim=c(45,75), ylim=c(0,60)) # xlim and ylim to set limits for the axes
par(new=T) # so that the next plot does not erase the existing one
hist(height_girls, border="pink", main="", xlab = "", ylab = "", xlim=c(45,75), ylim=c(0,60)) # labels were already there
# we can remove the axes altogether when drawing:
hist(height_girls, border="pink", main="", xlab = "", ylab = "", xlim=c(45,75), ylim=c(0,60), xaxt="n",yaxt="n") # labels were already there
# now we're finally good to go in three steps:
hist(height_boys, border="lightblue", main="Histogram of heights", xlab = "Height", xlim=c(45,75), ylim=c(0,60)) # xlim and ylim to set limits for the axes
par(new=T) # so that the next plot does not erase the existing one
hist(height_girls, border="pink", main="", xlab = "", ylab = "", xlim=c(45,75), ylim=c(0,60), xaxt="n",yaxt="n") # labels were already there
# exercise: add a legend to this plot to explain the colours
# other way exploiting the "hidden" add parameter:
# FIRST STEP
hist(height_boys, border="blue", main="Histogram of heights", xlab = "Height", xlim=c(45,75), ylim=c(0,60)) # xlim and ylim to set limits for the axes
# SECOND AND LAST STEP
hist(height_girls, border="red", main="", xlab = "", ylab = "", xlim=c(45,75), ylim=c(0,60), xaxt="n",yaxt="n", add=T) # labels were already there
?legend
savehistory("R_history_05_02_pm.R")
str(mtcars)
cu_in_to_L = 0.0163871
hist(mtcars[mtcars$cyl==4,"mpg"]) -> histobj # saving the histogram as an R object
str(histobj)
plot(histobj,yaxp=c(0,2,2), main='Histogram of some consumption values',xlab="Consumption (mpg)")
plot(histobj,yaxp=c(0,1,2), main='Histogram of some consumption values',xlab="Consumption (mpg)")
plot(histobj,yaxp=c(0,1,1), main='Histogram of some consumption values',xlab="Consumption (mpg)")
plot(histobj,yaxp=c(0,2,2), main='Histogram of some consumption values',xlab="Consumption (mpg)") # correct solution for exercise 1
?axes
?axis
?axis # for complete control on your axes (use after issuing a plot with xaxt="n" and/or yaxt="n")
ls()
hist(height_boys, border="blue", main="Histogram of heights", xlab = "Height", xlim=c(45,75), ylim=c(0,60)) # xlim and ylim to set limits for the axes
hist(height_girls, border="red", main="", xlab = "", ylab = "", xlim=c(45,75), ylim=c(0,60), xaxt="n",yaxt="n", add=T) # labels were already there
?legend
legend(x='topright')
legend(xx='topright', legend = "boy", "girl")
legend(x='topright', legend = c("boys", "girls"), fill=c("blue","red"))
legend(x='topright', legend = c("boys", "girls"), fill=c("blue","red"))
legend(x='topright', legend = c("boys", "girls"), fill=c("blue","red"))
legend(x='topright', legend = c("boys", "girls"), fill=c("blue","red"))
hist(height_boys, border="blue", main="Histogram of heights", xlab = "Height (ft)", xlim=c(45,75), ylim=c(0,60)) # xlim and ylim to set limits for the axes
hist(height_girls, border="red", main="", xlab = "", ylab = "", xlim=c(45,75), ylim=c(0,60), xaxt="n",yaxt="n", add=T) # labels were already there
legend(x='topright', legend = c("boys", "girls"), fill=c("blue","red"), border=F)
hist(height_boys, border="blue", main="Histogram of heights", xlab = "Height (ft)", xlim=c(45,75), ylim=c(0,60)) # xlim and ylim to set limits for the axes
hist(height_girls, border="red", main="", xlab = "", ylab = "", xlim=c(45,75), ylim=c(0,60), xaxt="n",yaxt="n", add=T) # labels were already there
legend(x='topright', legend = c("boys", "girls"), fill=c("blue","red"), border=c("blue","red"))
legend(x='topleft', legend = c("boys", "girls"), fill=c("blue","red"), border=c("blue","red"))
legend(x=60,y=50, legend = c("boys", "girls"), fill=c("blue","red"), border=c("blue","red")) # we can use numerical values for the position
hist(height_boys, border="blue", main="Histogram of heights", xlab = "Height (ft)", xlim=c(45,75), ylim=c(0,60)) # xlim and ylim to set limits for the axes
hist(height_girls, border="red", main="", xlab = "", ylab = "", xlim=c(45,75), ylim=c(0,60), xaxt="n",yaxt="n", add=T) # labels were already there
legend(x='topright', legend = c("boys", "girls"), fill=c("blue","red"), border=c("blue","red"),bty='n')
hist(height_boys, border="blue", main="Histogram of heights", xlab = "Height (ft)", xlim=c(45,75), ylim=c(0,60)) # xlim and ylim to set limits for the axes
hist(height_girls, border="red", main="", xlab = "", ylab = "", xlim=c(45,75), ylim=c(0,60), xaxt="n",yaxt="n", add=T) # labels were already there
legend(x=70, y=60, legend = c("boys", "girls"), fill=c("blue","red"), border=c("blue","red"),bty='n') # higher up
hist(height_boys, border="blue", main="Histogram of heights", xlab = "Height (ft)", xlim=c(45,75), ylim=c(0,60)) # xlim and ylim to set limits for the axes
hist(height_girls, border="red", main="", xlab = "", ylab = "", xlim=c(45,75), ylim=c(0,60), xaxt="n",yaxt="n", add=T) # labels were already there
legend(x=65, y=66, legend = c("boys", "girls"), fill=c("blue","red"), border=c("blue","red"),bty='n') # higher up
hist(height_boys, border="blue", main="Histogram of heights", xlab = "Height (ft)", xlim=c(45,75), ylim=c(0,60)) # xlim and ylim to set limits for the axes
hist(height_girls, border="red", main="", xlab = "", ylab = "", xlim=c(45,75), ylim=c(0,60), xaxt="n",yaxt="n", add=T) # labels were already there
legend(x=69, y=70, legend = c("boys", "girls"), fill=c("blue","red"), border=c("blue","red"),bty='n') # higher up
?read.csv
## WORKING WITH ANOTHER DATASET
dat = read.table("tutorial_data.csv", sep=";") # failed to specify the decimal point
str(dat)
dat = read.table("tutorial_data.csv", header = T, sep = ";") # failed to specify the decimal point
str(dat)
dat = read.table("tutorial_data.csv", header = T, sep = ";", dec = ",") # correct decimal point
str(dat)
23,3
# we can specify the classes for the various columns right at import
# checking that in educ I have only a few values:
range(dat$educ)
summary(dat$educ) # not very informative
table(dat$educ)
table(dat$BMI) # table() also works with numeric values
table(dat$educ)
str(dat)
table(dat$SEX)
dat$SEX = factor(dat$SEX)
str(dat)
# specify the classes for the different columns:
dat = read.table("tutorial_data.csv", header = T, sep = ";", dec = ",", colClasses = c("integer","factor","integer","numeric","logical","numeric","factor","integer",rep("logical",2)))
dat = read.table("tutorial_data.csv", header = T, sep = ";", dec = ",", colClasses = c("integer","factor","integer","numeric","logical","numeric","factor","integer",rep("logical",2))) # a logical column needs to see 'T's and 'F's only
dat = read.table("tutorial_data.csv", header = T, sep = ";", dec = ",", colClasses = c("integer","factor","integer",rep(c("numeric","factor"),2),"integer",rep("factor",2)))
# let's play a bit with rep()
rep(3,5) # replicate the value 3 five times
rep(1:3,5)
# a vector is always FLAT, no nesting:
c(c(c(1,2),3),c(6:8)) # results in a flat vector
rep(c("jb",'helen',"ermias"),4)
# pay attention at the difference:
rep(1:3,5)
rep(1:3,each=5)
str(dat)
summary(dat)
# a dataframe has colnames and rownames
colnames(dat)
head(rownames(dat),n=20)
tail(rownames(dat),n=20)
rownames(dat)[2]
rownames(dat)[2] = "1" # row names MUST be unique
rownames(dat) = dat$RANDID # using the random IDs as row names
sum(table(dat$RANDID)) # trying to check that all IDs are unique
vec = c(3,3,3,4)
sum(table(vec)) # trying to check that all IDs are unique
sum(c("jb",'helen',"ermias")) # fails to convert to numeric
sum(c("1",'56',"2")) # fails to convert to numeric
sum(as.numeric(c("1",'56',"2"))) # doesn't even perform the automatic type transformation
mytable = table(dat$RANDID)
str(mytable)
str(table(vec)) # trying to check that all IDs are unique
length(table(dat$RANDID)) == nrow(dat) # correct test to check that all values in dat$RANDID are unique
?unique
unique(dat$RANDID) == nrow(dat)
length(unique(dat$RANDID)) == nrow(dat)
# beware when comparing objects
unique(dat$RANDID) == dat$RANDID
unique(dat$RANDID) == dat$RANDID # comparing two vectors, each one being of length 3109
?identical
identical(3,4)
identical(unique(dat$RANDID),dat$RANDID) # testing the equality between two objects
header(dat)
head(dat)
head(dat)
# now removing the column RANDID from the dataset:
newdat = dat[-1] # first solution
str(newdat)
newdat = dat[,-1] # first solution
str(newdat)
newdat = dat[c(2:10)] # third solution
str(newdat)
dat[1] = NULL # fourth solution
str(dat)
dim(dat)
f = dat
# give me the identifiers of all people stricly above 65 years of age
head(dat$AGE)
head(dat$AGE > 65)
length(dat$AGE > 65)
length(dat$AGE)
dat$AGE[dat$AGE>65] # gives a vector of all the ages of people above 65
# 929 people, but what are their IDs?
row_filter = dat$AGE > 65
length(row_filter)
5 > 49
dat[row_filter==TRUE]
dat[     ,row_filter==TRUE]
dat[row_filter==TRUE,]
dat[row_filter,]
rownames(dat[row_filter,]))
rownames(dat[row_filter,])
rownames(dat[row_filter,]) # these are all the IDs of people above 65.
rownames(dat[row_filter,]) # these are all the IDs of people above 65.
# SUBSETTING with subset() on a data frame
subset(dat, AGE>65) -> smaller_df # unprotected tokens in the formula refer to variable names in the said data frame
is.data.frame(smaller_df) # YES
nrow(smaller_df)
# we can have fun combining logical tests
identical(rownames(smaller_df),rownames(dat[row_filter,]))
# logical AND is '&'
# logical OR is '|'
subset(dat, AGE>65 & CURSMOKE==1) -> smaller_smaller_df # people older than 65 AND who smoke
dim(smaller_smaller_df)
dim(smaller_df)
# a logical OR would result in a larger dataframe than smaller_df:
dim(subset(dat, AGE>65 | CURSMOKE==1))
savehistory('R_history_05_03_am.R')
