library(tidyverse) # load the tidyverse functions

# Week_6_Task_2

data <- read_csv("data_phone.csv") # read in the data

# draw a graph
data %>%
  ggplot() + # you will need to edit this code
  geom_point(aes(x = screen_time_actual, y = screen_time_estimate))



# Week_6_Task_3 - Do people underestimate or overestimate their phone time use?

# create a new column (mutate) to reflect the difference
data_phone_diff <-
  data %>%
  mutate(est_diff = screen_time_actual - screen_time_estimate)

# remove the 0s and count how many positives and negatives
data_phone_diff %>%
  filter(est_diff != 0) %>% # remove the 0s
  count(est_diff > 0) # count how many positive and negatives

# now use the sign test table to decide whether people underestimated or overestimated
