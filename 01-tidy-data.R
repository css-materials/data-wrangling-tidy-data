# Practice tidy data

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
  data = __________,
  cols = - ________,
  names_to = __________,
  values_to = _________,
  names_transform = parse_number
)


# 2. tidy `grades`

# check
grades

# tidying the grades dataset
pivot_longer(
  data = ____________,
  cols = ____________,
  names_to = ________,
  values_to = _______
) %>%
  pivot_wider(
    names_from = ___________,
    values_from = __________
  )


# 3. tidy `activities`

# check
activities

# tidying the activities dataset
pivot_longer(
  data = _____________,
  cols = _____________,
  names_to = ____________,
  values_to = ___________
) %>%
  separate( __________, into = ____________ ) %>%
  pivot_wider(names_from = ________, 
              values_from = ___________)



