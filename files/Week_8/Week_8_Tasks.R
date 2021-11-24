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


data_w8 <- read_csv("data_stroop.csv")

view(data_w8)

data_w8 %>% 
  ggplot() +
  geom_density(aes(x = time, fill = condition), alpha = .5) # you need to edit this for Q

# create a new column which is the average time
data_w8 <- 
  data_w8 %>% 
  group_by(pID) %>% # for each participant
  mutate(avg_time = mean(time)) # create a new average time from the mean of the time column

# distribution of average times
data_w8 %>% 
  ggplot() +
  geom_histogram(aes(x = avg_time)) # you need to edit this for Q

# Do we need to filter out outliers?
# hint: you'll probably want to use an OR which is this symbol: |
data_w8_f <- 
  data_w8 %>% 
  filter() # you need to edit this for Q


# TASK 2 - REPLACE ALL "MISSING" PARTS

data_w8_summary <- 
  data_w8_f %>%
  group_by() %>% # edit this
  summarise(stroop_mean = mean(), # edit the mean() code
            stroop_se = sd()/sqrt(n())) # edit the sd() code


# take a look at this summary data
view(data_w8_summary)

# let's plot these means
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


# TASK 3 - paired t-tests

# filter is used to select two levels of the IV
stroop_comparison <-
  data %>%
  filter(stroop_condition == "compatible" | stroop_condition == "incompatible")

# run the t-test comparing the means of these two levels
t.test(data = stroop_comparison, stroop_time ~ stroop_condition, paired = TRUE)




