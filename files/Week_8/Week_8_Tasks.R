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
  geom_density(aes(x = time, fill = condition), alpha = .5)

# TASK 2 - REPLACE ALL "MISSING" PARTS

data %>%
  group_by(-MISSING-) %>%
  summarise(stroop_mean = mean(-MISSING-),
            stroop_se = sd(-MISSING-)/sqrt(n())) %>%
  ggplot(aes(x = -MISSING-,
             colour = -MISSING-,
             y = -MISSING-)) +
  geom_col(size = 2) +
  geom_errorbar(aes(ymin = -MISSING- - -MISSING-,
                    ymax = -MISSING- + -MISSING-),
                width = .2) +
  labs(x = "List type",
       y = "Time to read list (seconds)",
       title = "Data from the stroop experiment") +
  scale_colour_manual(values = c("darkgreen", "darkblue", "darkred")) +
  theme_classic()


# TASK 3 - paired t-tests

# filter is used to select two levels of the IV
stroop_comparison <-
  data %>%
  filter(stroop_condition == "compatible" | stroop_condition == "incompatible")

# run the t-test comparing the means of these two levels
t.test(data = stroop_comparison, stroop_time ~ stroop_condition, paired = TRUE)




