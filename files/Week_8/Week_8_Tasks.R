library(tidyverse)

# # processing of raw data for use in tasks - remove from final script
# load("tidy_data.RData")
# 
# data %>% 
#   select(starts_with("stroop")) %>% 
#   drop_na() %>% 
#   mutate(pID = 1:n(), .before = "stroop_control") %>%
#   pivot_longer(cols = starts_with("stroop"), names_to = "condition", values_to = "time", names_prefix = "stroop_") %>% 
#   write_csv("data_stroop.csv")

# TASK 1 - data processing

data_w8 <- read_csv("data_stroop.csv")

view(data_w8) # view the data

data_w8 %>% 
  ggplot() +
  geom_density(aes(), alpha = ) # you need to EDIT this for Q4

# create a new column which is the average time
data_w8 <- 
  data_w8 %>% 
  group_by(pID) %>% # for each participant...
  mutate(avg_time = mean(time)) # create a new average time from the mean of the time column

view(data_w8) # view the data

# distribution of average times
data_w8 %>% 
  ggplot() +
  geom_histogram(aes(x = avg_time)) # you need to EDIT this for Q6

# Do we need to filter out outliers?
# hint: you'll probably want to use an OR which is this symbol: |
data_w8_f <- 
  data_w8 %>% 
  filter(avg_time > 2 & avg_time < 20) # you need to EDIT this for Q7

# TASK 2 - conducting related samples t-tests

# calculate the means for the 3 levels of the condition IV
data_w8_f %>%
  group_by(condition) %>% # you need to EDIT this for Q
  summarise(stroop_mean = mean(time)) # you need to EDIT this for Q 

# filter is used to select two levels of the IV
stroop_comparison <-
  data_w8_f %>%
  filter(condition == "compatible" | condition == "incompatible")

# run the t-test comparing the means of these two levels
t.test(data = stroop_comparison, time ~ condition, paired = TRUE)



# TASK 3 - summarising and visualisation 




# take a look at this summary data
view(data_w8_summary)

# let's plot these summary data
data_w8_summary %>%
  ggplot(aes(x = , y = )) + # map variables to x and y
  geom_col(size = 2)

# let's do the same again, but with error bars
data_w8_summary %>%
  ggplot(aes(x = , y = )) + # map variables to x and y
  geom_col(size = 2) +
  geom_errorbar(aes(ymin =  , # edit this for Q
                    ymax = ), # edit this for Q
                width = .2)







# ### EXTRA - Pipe it to ggplot()
# 
# The results of this summary can now be graphed, by sending the results (`%>%`) into the ggplot command. Read through the code below carefully, then click Run to plot these means and standard errors in a graph:
# 
#   ```{r plot_se, exercise = TRUE}
# 
# data %>%
#   group_by(home_location) %>%
#   summarise(mean_travel = mean(countries_visited),
#             se_travel = sd(countries_visited)/sqrt(n())) %>% # This line and those above are the same as the previous code chunk
#   ggplot(aes(y = mean_travel, x = home_location)) + # Adding a ggplot (graph)
#   geom_col() + # columns
#   geom_errorbar(aes(ymin = mean_travel - se_travel, # the minimum value for the error bar
#                     ymax = mean_travel + se_travel), # the maximum value for the error bar
#                 width = .2) # how wide we want the error bar - feel free to change this.
# 
# 
# ```
# 
# ```{r plot_se-solution}
# 
# data %>%
#   group_by(home_location) %>%
#   summarise(mean_travel = mean(countries_visited),
#             se_travel = sd(countries_visited)/sqrt(n())) %>%
#   ggplot(aes(y = mean_travel, x = home_location, colour = home_location, fill = home_location)) +
#   geom_col() +
#   geom_errorbar(aes(ymin = mean_travel - se_travel, # the minimum value for the error bar
#                     ymax = mean_travel + se_travel), # the maximum value for the error bar
#                 width = .2) # how wide we want the error bar - feel free to change this.
# 
# 
# ```
# 
# Note how we have placed the y and x mappings into the `ggplot(aes())` here, so that they are shared by the columns (`geom_col`) and the error bars (`geom_errorbar`).
# 
# The graph is very grey and boring! Within `ggplot()`, try to mapping the *home_location* variable to *fill* as well as *x*. Now try mapping it to *colour* instead of, or in addition to, *fill*. Note how the *fill* feature is applied to only the columns, but the *colour* feature applies to both the columns and the error bars. There is a solution available if you get stuck.
# 
# There's lots of things you can change in graphs. Try playing around with some of the fixed settings (i.e., outside of `aes()`). Here are some suggestions. What can you come up with?
# 
# - geom_col(alpha = .3, fill = "orange")
# - geom_col(linetype = 4, fill = "white")
# - geom_col(linetype = 6, size = 2)
# - try the linetype, alpha and size settings in the `geom_errorbar()` geom. Put them outside of `aes()`


