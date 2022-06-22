# load required packages
library(tidyverse)
library(rcfss)

# tidy `race`
race

## tidying operation
pivot_longer(
  data = race,
  cols = -Name,
  names_to = "Time",
  values_to = "Score",
  # ensure the Time column is stored as a numeric column
  names_transform = parse_number
)

# tidy `grades`
grades

## tidying operation
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

# tidy `activities`
activities

## tidying operation
pivot_longer(
  data = activities,
  cols = c(work.T1:talk.T2),
  names_to = "variable",
  values_to = "value"
) %>%
  separate(variable, into = c("location", "time")) %>%
  pivot_wider(names_from = location, values_from = value)
