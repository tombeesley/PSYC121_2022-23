---
author: "John Towse, Tom Beesley"
date: "2022-12-01"
output:
  html_document: default
  pdf_document: default
---

# Week 4: Customisation of graphs, and z-scores

> Written by John Towse & Tom Beesley

## Pre-lab work

-   Complete materials from sessions in previous week (materials from week 1 /2 / 3 remain fully available for anyone who wants them). Consolidate what we have already covered.

-   This week - again, there's a learnr tutorial to follow and help prep for what we are covering: [You can find it here](https://ma-rconnect.lancs.ac.uk/W4LabPrep/){target="_blank"}.

-   Make sure you have access to the `week4.zip` file for the RStudio server.[You can get the file here](files/Week_4/week_4.zip).

-   If you create a folder and upload the file into RStudio before the lab class you'll be even more ready to follow along!

## R Studio tasks

Last week we introduced two different ways to get descriptive information about a variable / column of scores investigated as a function of a separate piece of information. In others words, describe the DV a function of an IV

Students were generally very good at utilising each of these;

`aggregate(x = DV, by = list(IV), FUN = mean)`

and

`tibble %>% group_by(IV) %>% summarise(mean_estimate = mean(DV))`

[tibble = technical name for the data in R]}

This week, we're focusing on how you can edit or customise a graph to be more useful to a viewer.

## Section 1 - Customisation of data plots

Step 1. Set up a folder for this week in the R Project that you created last week.

Step 2. Bring the `week4.zip` file into R Studio server. Like last week, upload the zip file, and load in the data file. Launch the week_4 R script as before.

{If you've done Step 1 &2 already as a pre-lab preparation, super, pat yourself on the back, skip these steps an move on)}

Step 3. Once again, we're gong to be using commands from the tidyverse library (the pipe operator is one example) so we need to ensure that it's active. Run the command

`library(tidyverse)`

Step 4. Read in the datafiles that will be on the server. There's already a script line for this, you just need to change the file name (see the comments for advice on this)

Step 5. We've provided a suggestion of how you can complete the visualisation challenge task from week 3.

Step 6. Customize you graph work. We've provided some suggestions about adding titles and labels for your graph. Edit and play with the script lines to make them useful to you and to understand how they work.

-   Try change the text, the colours, and so on of the graphs.
-   Add comments for yourself about what the different commands do. The idea is to learn by trying different things out (changing values, taking out elements of the command, putting other is) and record for yourself.
-   If you are struggling or not sue, try look at help files.

## Section 2: z-scores

> Hint / Reminder: Sketch a normal (z score) distribution and mark the mean/mode, and mark off the relevant parts of the question so you know what you are trying to achieve and how to interpret any calculations you make.

> Hint/ Reminder 2. For questions 6 & 7, remember that from the week 4 lecture material, typically in psychology we use the 5% level as a cutoff to decide, in broadly described terms, whether something is extreme or unlikely vs. at least somewhat plausible or likely.

### z-scores 1

z-score distributions

Q1. What is the relationship between the sign of a z-score and its position in a distribution?

Q2. If a distribution has a mean of 100 and a standard deviation of 10, what is the raw score equivalent to a z-score of 1.96?

Q3. If a distribution has a mean of 157 and a standard deviation of 19, what is the raw score equivalent to a z-score of 1?

### z-scores 2 Using z-score tables

Q4. What proportion of scores lie between the mean and a z-score of 0.5?

Q5. What is the combined proportion of scores lying between z=-1.2 and z=.85?

### z-scores 3 Applying z-scores to inferential problems

Q6. A Neuropsychologist has presented a test of face recognition to 200 neurotypical participants and finds that the scores are normally distributed with a mean of 85 and the standard deviation of 12. Two brain-damaged patients are also given the test. The one with right hemisphere brain damage scored 58 and the one with left hemisphere damage scored 67.

1.  What is the z score of the right hemisphere patient when compared to the neurotypical group?

2.  What proportion of neurotypical participants score lower that this patient?

3.  Is this patient likely to belong to the population of neurotypical participants? (justify your answer)

4.  What is the z score of the left hemisphere patient when compared to the neurotypical group?

5.  What proportion of neurotypical participants score lower than this patient?

6.  Is this patient likely to belong to the population of neurotypical participants? (justify your answer)

### Extra activity

Come back to this afterwards for some extra practice if you want:

Q7. Tom Bunion has completed a huge research study and measured the foot size of men and women and found each to be normally distributed. The men have a mean size of 55 with a standard deviation of 5 and the women a mean of 33 and a standard deviation of 5. Joanna Toes has foolishly measured two individuals but forgotten to note their gender. These have foot sizes of 37 and 47. To which gender is each more likely to belong? What evidence is there for this?
