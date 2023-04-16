#Week 4: dplyr package

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
install.packages('dplyr')
library(dplyr) # Loading Dplyr package

#Task: Write the function to get a dataset from Base R: Titanic
Titanic <- read.csv('C:/Users/ragha/Documents/syllabus/ANA_505/week_4/train.csv')


#and give the dataframe a new name of your choice
#(hint: you will want your data to be a dataframe. Use the function: as.data.frame(Titanic))
df_titanic <- data.frame(Titanic)

#See the top rows of the data
#TASK: Write the function to see the top rows of the data
head(df_titanic)

#Let's just see the Survived and Sex columns
#Task: Write the function to 'select' the Survived and Sex columns 
#(hint: use the 'select' function)
selected_titanic <- select(df_titanic,Survived,Sex)

#Let's name the dataset with just the two columns, Survived and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name
saveRDS(selected_titanic, file = "df_data.RDS") 
df_new<- readRDS("df_data.RDS")
head(df_new)

#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)
remove_df <- df_new %>% select(-one_of("Sex"))
head(remove_df)

#Let's rename a column name
#TASK: Write the function that renames 'Sex' to 'Gender'

#Let's make a new dataframe with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
gender_df <- data.frame(df_titanic %>% rename("Gender" = "Sex"))
head(gender_df)

#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'
male_df <- filter(gender_df , Gender == 'Male')
head(male_df)


#Let's 'arrange' our data by gender (not the data you just filtered)
#TASK: Write the function to group the data by gender (hint: arrange())
arrange(gender_df, Gender) 

#Let's see how many people were examined in the dataset (total the frequency in the original dataframe)
#TASK: Sum the Freq column
#TASK: After you run it, write the total here:_2201___
sum(df_titanic$Freq)


#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'
female_df <- filter(gender_df , Gender == 'Female')
head(female_df)

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')
male_female_df <- bind_rows(male_df,female_df)
male_female_df

#Optional Task: add any of the other functions 
#you learned about from the dplyr package

