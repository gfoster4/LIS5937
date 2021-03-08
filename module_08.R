#Step 1

x= read.table("Assignment 6 Dataset.txt", header=TRUE, sep=",")

install.packages("plyr")
library(plyr)
y = ddply(x, "Sex", transform, Grade.Average=mean(Grade))
y

write.table(y, "Sorted_Average")
write.table(y, "Sorted_Average", sep=",")

newx = subset(x, grepl("[iI]", x$Name))
newx

write.table(newx,"DataSubset", sep=",")
