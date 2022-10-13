# Practice tidy data - solutions

# look at the website page "Practice tidying data"
# for info about the data structure of each of these datasets

# load required packages
library(tidyverse)
library(rcis)

# 1. tidy `race`

# check
race

# tidying the race dataset
pivot_longer(
  data = race,
  cols = -Name,
  names_to = "Time",
  values_to = "Score",
  # ensure the Time column is stored as a numeric column
  names_transform = parse_number
)


# 2. tidy `grades`

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


# 3. tidy `activities`

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
