#Week 4: dplyr package

#Task: Write the code to get a dataset from Base R: ChickWeight
#and save it as a dataframe with a new name that includes your first name
data("ChickWeight")
EricaChickWeight <-data.frame(ChickWeight)

#See the top rows of the data
#TASK: Write the code to see the top rows of the data
head(ChickWeight)

#Install and call the package dplyr
#TASK: Write the code to install and call dplyr
install.packages("dplyr")
library(dplyr)

#Let's just see the weight and Time columns
#Task: Write the code to 'select' just the weight and Time columns 
#(hint: use the 'select' function)
selected_data <- EricaChickWeight %>%
  select(weight,Time)
head(selected_data)

#Let's name the dataset with just the two columns, weight and Time
#TASK: Write the code to save the two columns as a new dataframe
#and give it a new name
EricaChickWeight2 <- selected_data

#Let's get rid of the Time column in the new dataframe created above
#TASK: Write the code that deselects the Time column
#(hint: use the 'select' function to not select a -column)
EricaChickWeight2 <- select(EricaChickWeight2, -Time)

#Let's rename a column name
#TASK: Write the code that renames 'weight' to 'ounces'
EricaChickWeight2 <- rename(EricaChickWeight2, ounces=weight)

#Let's make a new dataframe with the new column name
#TASK: Write the code that names a new dataframe that includes the 'ounces' column
ounces_object <- EricaChickWeight2$ounces
EricaChickWeight3 <- data.frame(ounces = ounces_object)
head(EricaChickWeight3)

#Let's 'filter' our dataframe to only those with a 1 in the Chick column
#TASK: Write the code that includes only rows where Chick = 1
filtered_ECW <- filter(EricaChickWeight, Chick == 1)
head(filtered_ECW)

#Let's 'group' our data by Diet
#TASK: Write the code to group the data by Diet (hint: group_by)
grouped_ECW <- group_by(filtered_ECW, Diet)
head(grouped_ECW)

#Task: add one of the other codes (not in the tasks above) 
#you learned about from the dplyr package
summary_ECW <- summarise(grouped_ECW, avg_weight = mean(ounces))
head(summary_ECW)
