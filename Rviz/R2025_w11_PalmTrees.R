# Palm Trees - TidyTuesday Week 11

pacman::p_load(tidytuesdayR, tidyverse, janitor, here, scales)
source('Rviz/handy_functions.R')

#tuesdata <- tidytuesdayR::tt_load('2025-03-18')
#tuesdata <- tt_load(2025, week = 11)

palmtrees <- 
  read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-03-18/palmtrees.csv')


palmtrees |> colnames()
palmtrees |> sample_n(20) |> view()
palmtrees |> plot_missing_values('Palm Trees Data')


palmtrees |> nrow()

palmtrees |> count(conspicuousness)
palmtrees |> glimpse()

palmtrees |> colnames()
palmtrees |> count(acc_genus, sort = T)
palmtrees |> count(acc_species, sort = T)
palmtrees |> count(palm_subfamily, sort = T)
palmtrees |> count(climbing, sort = T)
palmtrees |> count(palm_tribe, sort = T)
palmtrees |> count(fruit_size_categorical, sort = T)
palmtrees |> count(fruit_color_description, sort = T)
palmtrees |> count(main_fruit_colors, sort = T)
palmtrees |> count(fruit_shape, sort = T)

palmtrees |> 
  select(where(is.numeric)) |> 
  pivot_longer(everything()) |> 
  ggplot(aes(value)) +
  geom_histogram() +
  facet_wrap(~name, scales = 'free')

palmtrees |> 
  ggplot(aes(max__blade__length_m, max__petiole_length_m)) +
  geom_point() +
  geom_smooth(method = 'lm')

