#Setting the working directory
setwd("~/Documents/Current_Classes/R_Programming/Open Source R Directory")

#Importing the 2011 Canadian Election Study on Attitudes Towards Abortion
data <- read.csv("can_election.csv")

#Taking a quick look at the data
class(data)
summary(data)

#The abortion column is in a yes and no format, so this will make a simple grouping column
unique(data$abortion)

data$abortion <- factor(data$abortion, ordered=TRUE, levels=c("No", "Yes"))
class(data$abortion) #Now the abortion column can be read as logical values rather than characters

#The Education Column will also be useful as a grouping factor
unique(data$education)
data$education <- factor(data$education, ordered=TRUE, levels=c("lessHS", "HS", "somePS", "college", "bachelors", "higher"))
class(data$education)

#Lastly we will want to do the same to the gender column
unique(data$gender)
data$gender <- factor(data$gender, ordered=TRUE, levels=c("Female", "Male"))
class(data$gender)

#Now most of the important variables are able to be used for analysis
#Let's make some plots!
#The first plot I will make with base R graphics

#I want a good idea of how gender and education impact opinions on abortion
plot(data$gender, data$abortion) 
plot(data$education, data$abortion) 

#It looks like gender doesn't play a huge role, the vast majority of people regardless of gender feel that abortion should not be banned. 
#The education plot reveals an interesting trend, as the highest educated population, those with a graduate degree ("higher"), has the lowest percentage of people that think abortion should be banned.
#Similarly, the least educated population, those that didn't finish high school, has the highest population of people that think abortions should be banned.

#Now let's see if there is a relationship between Canadian Province and Abortion Sentiment
unique(data$province)
data$province <- factor(data$province, ordered=TRUE, levels=c("BC", "QC", "NL", "ON", "PE", "NS", "NB", "MB", "SK", "AB"))
class(data$province)

library(ggplot2)

ggplot(data, aes(province, abortion, color=abortion)) + geom_col()
#It looks like Ontario and Quebec have the highest populations in favor of abortion being illegal, highlighted in yellow


#Let's check and see if there is a drastic difference between urban and rural provinces
unique(data$urban)
data$urban <- factor(data$urban, ordered=TRUE, levels=c("urban", "rural"))       
class(data$urban)

ggplot(data, aes(urban, abortion, color=abortion)) + geom_col()
#It appears that the urban populations have more people overall in favor of getting rid of abortions, however the rural population has a much higher overall percentage of people in favor of getting rid of abortions. 

#While looking at two variables at a time is well and good, I would like to explore several at a time. 
#Let's make a multivariate plot

#First we will have to narrow down our dataset to 3 or 4 variables we want to explore. I only want province, education, gender, and abortion
colnames(data)
data1 <- data[,c(3, 9, 6, 7, 1, 2, 4, 5, 8, 10)]
colnames(data1)
data1 <- data1[,-5:-10]
summary(data1)

library(cdparcoord)
mm <- discretize(data1,nlevels=100) 
discparcoord(mm,k=5000,saveCounts=FALSE,name="2011 Canadian Sentiment on Abortions") 
