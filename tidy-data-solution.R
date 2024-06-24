# PRACTICE TIDYING DATA - SOLUTIONS

# load required packages
library(tidyverse)
library(rcis)

# 1. TIDY THE `RACE ` DATA

# check
race

# solution a
pivot_longer(
  data = race,
  cols = c(`50` : `350`), 
  names_to = "Time",
  values_to = "Score",
  # ensure the Time column is stored as a numeric column
  names_transform = list(Time = as.double)
)

# solution b
pivot_longer(
  data = race,
  # take everything beside Name
  cols = -Name, 
  names_to = "Time",
  values_to = "Score") %>%
  # ensure the Time column is stored as a numeric column 
  # parse_number is a function from readr to convert a character to a numeric vector
  mutate(Time = parse_number(Time))



# 2. TIDY THE `GRADES` DATA

# check
grades

# tidying the grades dataset
pivot_longer(
  data = grades,
  cols = c(Fall:Winter),
  names_to = "Quarter",
  values_to = "Score"
) %>%
  pivot_wider(
    names_from = Test,
    values_from = Score
  )



# 3. TIDY THE `ACTIVITIES` DATA

# check
activities

# tidying the activities dataset
pivot_longer(
  data = activities,
  cols = c(work.T1:talk.T2),
  names_to = "variable",
  values_to = "value"
) %>%
  separate(variable, into = c("location", "time")) %>%
  pivot_wider(names_from = location,
              values_from = value)
