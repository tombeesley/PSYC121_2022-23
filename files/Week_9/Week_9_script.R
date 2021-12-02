library(tidyverse)
library(pwr)
library(car)
library(rstatix)

# load("tidy_data.RData")
# data_raw <- data # keep copy

# data <-
#   data_raw %>%
#   select(facebook_friends, instagram_followers,
#          starts_with("music")) %>%
#   mutate(pop_score = rowSums(across(music_swift:music_drake), na.rm = TRUE),
#          rock_score = rowSums(across(music_coldplay:music_rhcp), na.rm = TRUE)) %>%
#   mutate(facebook_friends= round(facebook_friends)) %>%
#   select(-starts_with("music")) %>%
#   drop_na() %>%  # at this stage get rid of NAs
#   mutate(music_pref = if_else(pop_score > rock_score, true = "pop-tastic", false = "rock-on"))
# 
# write_csv(data, "music_smedia.csv")

data_w9 <- read_csv("music_smedia.csv") # read in the data

# TASK 1 - data visualisation and cleaning

data_w9 %>% 
  ggplot() +
  geom_jitter(aes(x = rock_score, y = pop_score, colour = music_pref))

# draw a histogram of the instagram followers data
data_w9 %>% 
  ggplot() +
  geom_histogram(aes(x = instagram_followers))

# draw a histogram of the facebook friends data
data_w9 %>% 
  ggplot() +
  geom_histogram(aes(x = facebook_friends))

data_w9 <- 
  data_w9 %>% 
  mutate(z_FF = scale(facebook_friends), # z-transform of facebook friends
         z_IF = scale(instagram_followers)) # z-transform of instagram followers


# removing outliers
data_w9_f <- 
  data_w9 %>% 
  filter(z_FF < 2.5 & z_IF < 2.5) # 

# TASK 2 - Testing differences with a t-test
#optional plot - probably remove
data_w9_f %>% 
  ggplot() +
  geom_point(aes(x = instagram_followers, y = facebook_friends, colour = music_pref))

# summarise the data
data_w9_f %>% 
  group_by(music_pref) %>% 
  summarise(meanFF = mean(facebook_friends),
            meanIF = mean(instagram_followers),
            N = n()) # how many in each group - no need to edit this

# collect the relevant data for t-test

# test for equality of variances
var.test(data = data_w9_f, facebook_friends ~ music_pref)

# perform the t-test
t.test(data = data_w9_f, 
       facebook_friends ~ music_pref, 
       paired = FALSE, 
       var.equal = TRUE) # change this based on the results of your levene test

cohens_d(data = t_test_comp, formula = instagram_followers ~ music_pref)

# TASK 3 - Thinking about power

pwr.t.test(n = 21, d = 0.486, type = "two.sample")



# TASK 4 - removing outlier values




