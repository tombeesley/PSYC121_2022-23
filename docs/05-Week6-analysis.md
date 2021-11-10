---
output:
  html_document: default
  pdf_document: default
---




# Week 6: [NOT FOR CLASS TEST!] Visualising data and binomial tests

> Written by Tom Beesley & John Towse

They say a picture paints a thousand words, so in this week's lab we will be learning some fundamental skills in **data visualisation** with the `ggplot()` commands.  We will then conduct our first statisitical test to tell whether there is a *real difference* in our data. You must ensure you have watched the lecture and done the pre-lab work before coming to class. 

## Pre-lab work: online tutorial

To access the pre-lab tutorial click here: <https://ma-rconnect.lancs.ac.uk/Week6_LabPrep/> (on campus, or VPN required)

## RStudio Task 1: Creating a new folder and project

We are going to set up a new foler for this week and an RStudio *Project*. This is a good practice for organising your scripts and data. 

1. When you are logged on to the [RStudio Server](psy-rstudio.lancaster.ac.uk), navigate to your home directory by clicking on the small house icon:

![home button](files/Week_6/home_button.png)
2. Click the "New Folder" button just above the home button. Name the folder something sensible (e.g., Week_6) and click OK.

3. Click on this folder and then click "More" and "Set As Working Directory". This tells RStudio that you are now working in this directory. When you read in data using `read.csv` it will know where to look for the file name that you provide.

![set working directory](files/Week_6/working_dir.png)

4. Let's add the files we need for this week. Download the [Week_6_files.zip](files/Week_6/Week_6_files.zip) and upload it into RStudio Server. If you need them, [here are the key instructions](#uploading_zip) from Week 2.

5. Now let's finish this process by making this a *Project*. Click on the small blue icon in the top right of RStudio, and clicking "New Project":

![create a new project](files/Week_6/new_project.png)
6. You may be asked to save the workspace or data - you should do this. Then select "Existing Directory" and make sure that the new directory you have created is selected as the "Project Working Directory" - it should be, if you set the working directory correctly above. If not, navigate to the correct directory here.

7. And you're done! This should now appear as a project in your front page on RStudio. You can get back to that front page by clicking the red power button in the top right corner. Using projects has many benefits. It will keep all the content for the week in one place, and save the commands you've used in the console. You can also use the *Project Menu* to navigate quickly between different projects.


## RStudio Task 2: Visualising phone use

Now that you have completed the online tutorials on `ggplot()`, it's time to put those skills into practice with a new data set, provided in "data_phone.csv". In the survey, people estimated their daily phone use, and then looked up the actual time their phones were on. 

1. Open the script "Week_6_script.R". This is the script file you will use for tasks 1 and 2

2. Run the first two lines of code `library(tidyverse)` and `data <- read_csv("data_phone.csv")`

3. You should now have an object in environment called `data`. You can view this (the "spreadsheet view") by clicking on the object.

4. Run the ggplot command. You will see that this...

4. Inside the `aes()` command, map the variable *screen_time_estimate* to the x axis, and the variable *screen_time_actual* to the y axis. In general, does it look like people's estimates were accurate?

5. Add a setting for *colour* outside of the `aes()`, to make all the points red.

6. Map the *colour* to the variable *phone_type* (within `aes()`). Can you see any differences between people who have different phones?

7. Change the axis titles and add a title for the graph using the `labs()` command.

8. Change the theme of the graph.


## LAB TASK 3: 









