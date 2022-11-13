---
author: "John Towse, Tom Beesley"
date: "2022-11-13"
output:
  html_document: default
  pdf_document: default
---

# Week 3: DVs and IVs in RStudio

> Written by John Towse & Tom Beesley

## Pre-lab work

Last week we asked you to

-   Use a script to run instructions in RStudio
-   Put data into RStudio form a data file and explore how to run descriptive stats

This week - again, there's a learnr tutorial to follow and help prep for this week's activities [You can find it here](https://ma-rconnect.lancs.ac.uk/W3LabPrep/){target="_blank"}


## R Studio tasks

For the "penelope22" data in week 2, we provided you with estimates data, and you were able to generate descriptive statistics for the estimates (if not, please go back and work through that part of the week 2 lab sheet again). You also found the weight estimates for the female and non-female guesses, right?

However, in order to find the estimates separately for gender identity, we needed to have a column for each gender category. Whilst that worked, it could get cumbersome over time always to work with data created like that.

*There is a better way...*

### Task 1 - More with the penelope22 data

Step 1. This week, we again want to explore commands from the tidyverse library (toolkit) which can help us do more powerful things more elegantly. So let's get R to work with the tidyverse library

`library(tidyverse)`

Step 2. Explore help() commands. R can give you more information about how it works.

Step 3. Creating a project and a folder, and setting the working directory

Step 4. Bring the `week3.zip` file into R Studio server. Like last week, upload the zip file, and launch the R script.[You can get the file here](files/Week_3/week_3.zip)

Step 5. Read or load the penelope data into R. Have a look at it using the View() command in the script

This time, let's ask for the estimate data arranged by identity:

`aggregate(x = *MISSING*2$estimate, by = list(*MISSING*$identity), FUN = mean)`

First, let's try this (you will need to use your object name in place of MISSING). What do you get? Does this match what we did last week when we calculated the mean for the *female* and for the *other* (i.e., non-female) group?

Second, let's look at what is happening here:

`aggregate` This is a command to call for descriptive statistics 

`x=`
This defines what column we are analyzing

`by=list`
Now we tell R how to group the estimate data, and which column does that

`FUN=mean`
Specifies which descriptive function is being asked for
Can you explore whether you can call on alternate measures?)

#### group_by()

There's another way that also allows us to group scores by a (nominal) variable. This is explored in the learnr tutorial, which should help you create the command the get weight estimates broken down by gender identity. You need to define the data frame for the estimates data, and the gender IV and the estimates DV

`*MISSING* %>% group_by(*MISSING*) %>% summarise(mean_estimate = mean(*MISSING*))`

First, try this command and see what you get. If you run this command as entered, it won't work. So now use your experience at skills from the above and the learnr tutorial to work out what is required.

Note

`%>%`
This is called a "pipe operator", basically take the output from the left and feed it into the requests on the right. `Summarise`
Provide summary statistics information for the specified variable as specified (whether mean, median etc)

#### The assignment operator

As well as learning about the pipe operator, we want to remind you /draw attention explicitly to another important element of the R command line syntax: the assignment operator. Uing a command such as

`cows <- read_csv("penelope22.csv")`

looks for the csv datafile called 'penelope22', and assign it to an object or variable called 'cows'

We could create any object name we wanted (within limits of names already known to RStudio). It isn't just for reading in data files, we can perform a whole range of functions and assign them to an object.

#### Task 2 - Salary data

Using aggregate and summarise may not seem like much progress, because they are just replicating what we had already done with mean() is week 2. However (a) this emphasizes that there are often several ways to get at the same thing in R (b) now we know about grouping, about working with 2-dimensional data, we can start to do more efficient and informative things.

Now, let's turn to the guesses made about median salary in the UK. We can get the data from the file "wages" in the week_3.zip file (you will need to adapt the code in the script for the penelope data so that it will load in the wages data)

Let's take a peek at the dataset with

`glimpse(wages)`

Glimpse pretty much does what you might think from the meaning of the word -- it just gives us a data sample (handy because this is a much bigger dataset) and shows that we have 3 columns; uk_region (where someone lives, note 'other' probably equals Northern Ireland, Europe, China, etc), family_position (age relationship with siblings), and salary (estimate).

By the way, the govt statistics say the actual median income in 2019 was approx. £30,350 [see this link](https://www.statista.com/statistics/1002964/average-full-time-annual-earnings-in-the-uk/){target="_blank"}

A)  Writing into your script, use the working "aggregate" commands from task 1 with the penelope weight data to find out the salary guesses as a function of where someone lives? That is, can you adapt that code for this problem? First, make sure you read in the data file into an R object.

B)  Can you use the aggregate command to find out salary guess as a function of family relationships? (if you are the youngest child maybe you have older siblings earning money that changes your evaluation?)

C)  Can you get a breakdown of guess as a function of BOTH UK region AND family relationship together?

D)  Can you use  the `group by()` command to display salary guesses as a function of where someone lives? Check this this gives you the same answer

### Task 3 - Phone Use data

E) Datset 3: Use the dataset of phone screen time usage to further explore and consolidate the group_by() command (ie we'll drop the aggregate command for this task to focus on group_by(). Adapt script lines from the above two tasks to read in and calculate screen time usage as a function of the type of phone.

F)  Use RStudio to figure out the overall mean salary estimate and the standard deviation. Calculate by hand what salary estimate would have a z score of z=-1.5?

### Task 4 - Final challenge: visualisation

Can you find a way to visualise the screentime usage data that you have been working with above? The script provides two ways to consider doing this - boxplots (which we have looked at in script commands already) and ggplot, which we have spent less time with but is an extremely powerful engine for creating plots. We've provided the start of the code in each case, leaving you to work out the specifics. Remember to annotate your creations!

### Now you're finished ...

Remember to complete your notes in the script, save the script file, and end the server session.
