---
output:
  html_document: default
  pdf_document: default
---




# Week 8: Related-samples t-tests, plotting means and SE bars

> Written by Tom Beesley & John Towse

Today we will take a look at summarising means and standard errors (SEs) from our data. We will look at how we plot these together on the one graph (using `ggplot()` commands that allow us to share mappings between different geoms. We will explore our data on the famous “Stroop Task” and we will use a related-samples t-test to examine the differences between the means of our different conditions in this task. 

## Pre-lab work: online tutorial

**Online tutorial**: You must make every attempt to complete this before the lab! To access the [**pre-lab tutorial click here**](https://ma-rconnect.lancs.ac.uk/PSYC121_2022_Week_8){target="_blank"} (on campus, or VPN required)

**Getting ready for the lab class** 

1. Create a folder for Week 8 and download the [Week_8.zip](files/Week_8/Week_8_v2.zip) file and upload it into this new folder in RStudio Server. 

## RStudio Tasks

### Calculating means and SEs 

The “Stroop Effect” is a classic demonstration of automaticity of behaviour. Participants have to say the colour a word is printed in, which is an easy task for a “compatible” stimulus like <span style="color:green">**GREEN**</span>, and a much more difficult task for an “incompatible” stimulus like <span style="color:red">**BLUE**</span>. We can’t help but read the text - it has seemingly become an automatic process.

![](files/Week_8/stroop.png)
In this task we will calculate the means and standard errors of the means and then we will then plot them using ggplot(). First though, we'll need to inspect the data and maybe do a bit of data wrangling by using our `filter()` command.

1. Open the script “Week_8_script.R” (see prep work)

2. Run the `library` and add a `read_csv` line to read in the data set. Call your data something meaningful (perhaps *data_w8* or *data_stroop* but maybe not *bestest_most_fantastic_data_on_the_stroop_test_eva_init*)

3. View the data with `View(data)`. You will see that the data are a little different from the data we have worked with previously. We have an *pID* variable, which gives a unique number for each person and each person has 3 rows. This is because the different conditions of the Stroop task reflect a **within-subjects variable** (related samples). For data like this it is often useful to have them arranged in what is referred to as “long format”, with multiple rows for each response the participant provides. For the current data that means we have a variable called *condition*, which is our IV, and one called *time* which is our DV.

4. Let's look at the distribution of *time* (our DV) as a function of *condition*. Complete the next chunk of code by mapping *x* to *time* and *fill* to *condition* for our `geom_density()` plot. You can play around with the *alpha* parameter, setting it to a value between 0 and 1 - note that this is done OUTSIDE of the `aes()` command.

5. We seem to have some outlier values at both the high and the low ends. It's probably best if we remove data for the whole participant if their *average* time is unusual. To do that, we'll need to create a new column. Here we will introduce you to a new function called `mutate()`. This function will create a new variable (column) from an old one. Run this next block of code (you don't need to edit this one) to create the new column, *avg_time*. We are using this in combination with `group_by(pID)` because we want to calculate the average time for each participant. Use `view()` to take a look at the data to check the column has been created correctly. 

6. Edit the `geom_histogram()` code to plot the distribution of values in the new *avg_time* column. 

7. We now need the filter out the values in our data that we feel are unusual. Like last week, we will do this (for now) in a fairly unprincipled manner, by "eyeballing" the data (next week we'll consider something a bit more "scientific"). Complete the filter command so that it removes both the very low values in the *avg_time* column, and also those that are very high. Because you want to filter out low AND high values, you are using an **AND** expression (**&**). You will therefore need to enter in two numerical values, based on your assessment of the histogram produced for Q6. Note that you need to think about how you are storing the result of this filter process. Do you want to create a new object, or overwrite the existing object?

8. Check the new distribution of average times after this filter has been applied to the data. 

### Running related samples t-tests

We have seen in our density plots that the reaction times (DV) look different in the three different Stroop conditions (our IV). But now we need to look at whether there are **statistically significant differences** between the means of the three conditions. 

To do this, we will first summarise the mean time taken by each condition in the Stroop task. [Remember from Week 3](#group_by) that we can use `group_by()` and `summarise()` to get summary stats (e.g., mean, sd) at each level of the IV. That's what we want to do now:

1. Edit the `group_by()` code to specify the IV and the `summarise()` to calculate the `mean()` of our DV. If you do this correctly, you'll get three values - a mean value for each level (condition) of our IV. Do these means reflect what you would expect in the Stroop task?

2. Next we need to test if these differences between our means are real. To do that, we can run a related samples t-test; remember that the data for each level of the IV in this experiment came from the same person. We must use a `filter()` to restrict the data to just two levels of the IV: the *condition* column/variable in the data. This is because a related samples t-test looks at the difference between two means (and only two), so the column we use for the t-test needs to have just two levels of the IV (two of the conditions).

3. The filter command is already set up to restrict the data to two of the conditions. Note that the filter uses an “|” symbol, which means “or”, because we want the data that **is the same as** (==) one condition OR **is the same as** (==) the other condition.

4. Run the t-test on this selection of data, to compare the means from these two levels of the IV. Is the
result significant? Note the t-value and the p-value. 

5. Write out a statement to express this result. Here's a template you can use, where you need to edit the bits in the []: 

>"There [was a / was no] significant difference between the [describe the variables that were compared], t([degrees of freedom here]) = [t value here], p < [p value here]." 

6. With 3 levels to the IV *condition* there are 3 possible comparisons we can make (1 vs. 2; 1 vs. 3; 2 vs. 3). Complete all three tests, by copying and pasting the commands, editing each to make a different filter selection, and then to run the t-test. Write out a report statement (Q5) for each of your comparisons. 

### Plotting the means and SEs

1. In Task 2 you calculated the means for each condition in the Stroop task. We've seen in lectures that "standard error" provides an estimate of how variable that mean will be across the samples we collect. A very typical way to plot a mean value is to plot it with the standard error of the mean (SEM):

![](files/Week_8/error_bars.png)

2. The code from Task 2-Q1 will give the mean. We will now complete the second line of this code to give the standard error values. TO do this, you simply need to add the correct variable (DV) to the `sd()` command to calculate the SE values (note that you don't need to put anything in `n()`, as this simply calculates how many rows there are).

3. View the new object summary object you have created. Check that the means and SEs are different for the 3 conditions. If they are the same, you probably summarised the wrong column!

4. We will now plot these 3 mean values in a figure. Let's use `geom_point()` so that our means and SEs look a bit like the figure above. Complete the ggplot command to plot our summarised value called *stroop_mean* (y), as a function of the IV, *condition* (x).

5. Now we need to add some "error bars" which provide a visual guide as to how much uncertainty we have in our mean value. Edit the code for the `ggplot()` command to plot both `geom_point()` (same as Q4) and `geom_errorbar`. You will need to calculate a `ymin` and a `ymax` value. Use the illustration above to work out how to combine the mean value and the SE value (hint: add or subtract) to create the right `ymin` and `ymax`. 

EXTRA: These next steps can be completed to practice customising your plot

6. Add a `labs()` layer to the plot to change the axis titles, and the title of the plot.

7. Change the theme of the plot (e.g., `theme_void()`)

8. Map the *fill* aesthetic to the variable *stroop_condition*. You can do this for `geom_point` or `geom_errorbar` or both at once by putting it in the `aes()` within the `ggplot()` command.

9. Manually change the colours of the columns with using `scale_fill_brewer()`. Take a look at the Week 6 (6.3.7) for instructions on setting colours.

10. Try changing your `geom_point()` to `geom_col`.

### Saving your work

**Scripts:** By now you are hopefully getting used to editing and working within the script. As you know, to save a script, you simply click the save icon, or press ctrl+S (cmd+s on a mac).

**Plots:** To save a graph you have produced, click the "Export" button in the plot window, then "Save as Image". You can resize the graph and give it an appropriate filename. If you've set the working directory correctly, then the new file should appear in the current folder. 

**Data:** The data objects you create (in the Environment) only exist within RStudio, and are temporary (with a script and the csv file, you can always redo the analysis). But what if you want to use the data elsewhere? For example you may want to share the data with your project (PEP?) supervisor. To do this, we need to write the data to a csv file (like those we use to import the data). You can do this with the following command: `write_csv(the_data_object, "the_filename.csv")`. 

**Exporting from RStudio:** The above save operations save files to a folder within RStudio Server. At some stage you will need to get these files out of RStudio Server, for example if you need a graph for your report, or you need to share the data or the scripts. Or maybe you want to make the csv file available to other researchers. To get files out of RStudio, simply select the files you want in the Files pane, click "More" and then "Export". Selecting multiple files will produce a ".zip" file, which will need to be "unzipped" on your computer to access the individual files ([instructions for Windows](https://support.microsoft.com/en-us/windows/zip-and-unzip-files-f6dde0a7-0fec-8294-e1d3-703ed85e7ebc){target="_blank"} and [instructions for Mac](https://support.apple.com/en-gb/guide/mac-help/mchlp2528/mac){target="_blank"})

## Week 8 Quiz

You can access a set of quiz questions related to this week [here.](https://ma-rconnect.lancs.ac.uk/PSYC121_2022_Week_8_Quiz/){target="_blank"}
