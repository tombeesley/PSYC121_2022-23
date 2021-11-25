---
output:
  html_document: default
  pdf_document: default
---




# Week 8: [DRAFT - DO NOT COMPLETE YET] Plotting means, SEs and related-samples t-tests

> Written by Tom Beesley & John Towse

Today we will take a look at summarising means and standard errors (SEs) from our data. We will look at how we plot these together on the one graph (using `ggplot()` commands that allow us to share mappings between different geoms0. We will explore our data on the famous “Stroop Task” and we will use a related-samples t-test to examine the differences between the means of our different conditions in this task. 

## Pre-lab work: online tutorial

**Online tutorial**: You must make every attempt to complete this before the lab! To access the [**pre-lab tutorial click here**](https://ma-rconnect.lancs.ac.uk/Week_8_LabPrep){target="_blank"} (on campus, or VPN required)

**Getting ready for the lab class** 

1. Create a folder and a Project for Week 8. [Click here for the instructions](#creating_project) from Week 6 if you are unsure.

2. Download the [Week_8.zip](files/Week_8/Week_8.zip) and upload it into this new folder in RStudio Server. If you need them, [here are the instructions](#uploading_zip) from Week 2.

## RStudio Task 1: Calculating means and SEs 

The “Stroop Effect” is a classic demonstration of automaticity of behaviour. Participants have to say the colour a word is printed in, which is an easy task for a “compatible” stimulus like <span style="color:green">GREEN</span>, and a much more difficult task for an “incompatible” stimulus like <span style="color:blue">BLUE</span>. We can’t help but read the text - it has seemingly become an automatic process.

![](files/Week_8/stroop.png)
In this task we will calculate the means and standard errors of the means. We will then plot them using
ggplot().

1. Open the script “Week_8_script.R” (see prep work)

2. Run the `library` and `read_csv` lines of code. You should see an object in the environment called *data_w8*

3. View the data with view(data). You will see that the data are a little different from the data we have
worked with previously. We have an ID variable, which gives a unique number for each person. Each
person has 3 rows. This is because the different conditions of the stroop task is a within-subjects variable.
For data like this it is often useful to have them arranged in what is referred to as “long format”, with
multiple rows for each response the participant provided. For the current data that means we have a
variable called stroop_condition, which is our IV, and one called stroop_time which is our DV.

4. Let's look at the distribution of *time* (our DV) as a function of *condition*. Complete the next chunk of code by mapping *x* to *time* and *fill* to *condition* for our `geom_denisty()` plot. As per last week, you will want to set the *alpha* parameter to something between 0 and 1 - note that this is done OUTSIDE of the `aes()` command.

5. We seem to have some outlier values at both the high and the low ends. It's probably best if we remove data for the whole participant if their *average* time is unusual. To do that, we'll need to create a new column (remember `mutate()`?) to give us these average time values for each participant. Run the next block of code (you don't need to edit this one) to create the new column, then run the next line to `view()` it.

6. Edit the `geom_histogram()` command to plot the values of the avg_time column. 

7. We now need the filter out the values in our data that we feel are unusual. Like last week, we will do this in a fairly unprincipled manner, by "eye-balling" the data (next week we'll consider something a bit more "scientific"). Complete the filter command so that it removes both the very low values in avg_time column, and those that are very high. Because you want to filter out low and high values, you are using an **AND** expression (**&**). But you will need to enter in two numerical values, based on your assessment of the histogram produced for Q6. Note that the filtered data is stored as a new object: *data_w8_f* (f, for filtered).

## RStudio Task 2: Running related samples t-tests

We have seen in our denisty plots that the reaction times (DV) look different in the three different stroop conditions (our IV). But now we need to look at whether there are **statistically significant differences** between the means of the three conditions. 

To do this, we will first summarise the mean time taken by each condition in the stroop task. [Remember from Week 3](#group_by) that we can use `group_by()` and `summarise()` to get summary stats (e.g., mean, sd) at each level of the IV. That's what we want to do now:

1. Edit the `group_by()` code to specify the IV and the `summarise()` to calculate the `mean()` of our DV. If you do this correctly, you'll get three values - a mean value for each level (condition) of our IV. Do these means reflect what you would expect in the stroop task?

2. Next we need to test if these differences between our means are real. To do that, we can run a related samples t-test; remember that the data for each level of the IV in this experiment came from the same person. We must use a `filter()` to restrict the data to just two levels of the IV: the *condition* column/variable in the data. This is because a related samples t-test looks at the difference between two means (and only two), so the column we use needs to have just two levels.

3. Use the filter command to restrict the data to two of the conditions. Note that the filter uses an “|”
symbol, which means “or”, because we want the data from either one condition OR the another condition.

4. Run the t-test on this selection of data, to compare the means from these two levels of the IV. Is the
result significant? Note the t-value and the p-value. How would you express this as a statement in a report?

3. With 3 levels to the IV *condition* there are 3 possible comparisons we can make (1 vs. 2; 1 vs. 3; 2 vs. 3). Complete all three tests, by copying and pasting the commands, editing each to make a different filter selection, and then to run the t-test. Make sure you interpret the results of the t-tests.

## RStudio Task 3: Plotting the means and SEs

1. You will see we have provided you with the “scaffold” of a
complete analysis process for the Stroop data. The raw data will be grouped and then summarised as
means and SEs, and then plotted with columns and error bars. This is very similar to the commands
used at the end of the learnr tutorial, and you can refer to that analysis if you get stuck here. Your job
is to carefully work through the code and fill in the parts that are marked MISSING. By
the end, you should have a graph with 3 columns, with the standard error of the means plotted on top.

2. Add a labs() layer to the plot to change the axis titles, and the title of the plot.

3. Change the theme of the plot

4. Map the fill aesthetic to the variable stroop_condition

8. Manually change the colours of the columns with (e.g.) scale_fill_manual(values =
c("darkgreen", "darkblue", "darkred")). Open the RColor.pdf in the Week 8 files for
more colours than you’ll probably ever want!
9. Click Export->Save as Image. Then show it off to the world (i.e., the Teams channel)
