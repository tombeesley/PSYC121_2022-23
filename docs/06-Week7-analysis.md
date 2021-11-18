---
output:
  html_document: default
  pdf_document: default
---




# Week 7: [DRAFT - do not complete yet] One-sample t-test on salary estimates

> Written by Tom Beesley & John Towse

Today we will look in a bit more detail at people's estimates of the average UK salary. We will first plot this data using continue to develop our skills in **data visualisation** with the `ggplot()` commands.  We will look at plotting means and standard errors, and at how geoms can share aesthetic mappings. We will explore our data on the famous "Stroop Task" and calculate

## Pre-lab work: online tutorial

**Online tutorial**: To access the [**pre-lab tutorial click here**](https://ma-rconnect.lancs.ac.uk/Week_7_LabPrep){target="_blank"} (on campus, or VPN required)

**Getting ready for the lab class** 

1. Create a folder and a Project for Week 7. [Click here for the instructions](#creating_project) from last week if you are unsure.

2. Download the [Week_7.zip](files/Week_7/Week_7.zip) and upload it into this new folder in RStudio Server. If you need them, [here are the instructions](#uploading_zip) from Week 2.

## RStudio Task 1: Plotting and filtering

**Important!** - You should be using the Week_7_script as you work through these tasks. Edit the script to complete the tasks. Running code from the script is easy - place your cursor on the line or block of code you want to run and press "run" (of ctrl/cmd+enter). See the video on Moodle if you're unsure.

1. Open the Week_7_script and run the `library` and `read_csv` commands

2. Complete the `geom_histogram()` code to plot the distribution of salary data

3. OK - we've got some pretty funky values here! Some people think the average salary is £500,000!!! Well, maybe they just added too many zeros (let's give them the benefit of the doubt). Run the `arrange()` code to see what those high values are.

4. We'll need to remove these high values to get a better sense of the distribution. Let's use a `filter()` command to do this. Edit the `filter()` command to keep only those estimates that are below £200,000. Note that you are making a new object at this step (*data_w7_f*).

5. Now your filter has done its job, let's plot the data again. Edit the `aes()` command to draw the histogram.

6. And as you know, we can also look at the distribution as a boxplot. Edit the `geom_boxplot()` code to do this.

### Testing if the effect is significant

We now want to know if the salary estimates are different to the actual average salary in the UK (which is approx. £30,000). 

7. First, let's calculate the `mean()` of our salary estimates.

8. Now we can compute a t-statistic. Edit the code on this line to conduct a one-sample t-test...[more interpretation here]


![](files/Week_7/ttable.png)

### Plotting salary estimates by home location

9. Draw density plot

10. Map the fill aesthetic to the variable *home_location*

11. Manually change the colours of the columns by adding (+) this code as a layer to your ggplot code: `scale_fill_manual(values = c("darkgreen", "darkblue", "darkred"))`. Click here [add link] for a guide to colours - more than you'll probably ever want!

12. Click Export->Save as Image. 

