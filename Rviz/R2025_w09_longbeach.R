pacman::p_load(
  tidytuesdayR,
  tidyverse,
  janitor,
  here
)

tuesdata <- tt_load("2025-03-04")
tuesdata


pets <- tuesdata$longbeach
pets

# viz
pets |>
  mutate(animal_type = fct_infreq(animal_type) |> fct_rev()) |>
  ggplot(aes(y = animal_type)) +
  geom_bar()
