library(tidyverse)
options(scipen = 999) # this stops numbers appearing as scientific notation

# read in the data
data_w7 <- read_csv("uk_salary.csv")

# quick look at the salary estimates
data_w7 %>% 
  ggplot() + 
  geom_histogram(aes()) # EDIT THIS CODE FOR Q

# let's look at those unusual values
data_w7 %>% 
  arrange(desc(uk_salary)) # arrange the data according to descending values of uk_salary estimates

# let's remove those really high values
data_w7 <- # note the assignment (<-): the result of this calculation overwrites the old object
  data_w7 %>% # with the data...
  filter(uk_salary < 200000) # keep those estimates less than 200K

# now let's plot the salary estimates again
data_w7 %>% 
  ggplot()+
  geom_histogram(aes()) # EDIT THIS CODE FOR Q

# display the data as a boxplot
data_w7 %>% 
  ggplot() +
  geom_boxplot(aes(y = uk_salary))

# What is the mean estimate? Add code here for Q

# What is the median estimate? Add code here for Q

# Let's check if the mean estimate is significantly different from the true salary
t.test(x = , mu = ) # You will need to edit this for Q


# plot the data for the 
data_w7 %>% 
  ggplot() + 
  geom_density(aes()) # EDIT THIS CODE FOR Q

