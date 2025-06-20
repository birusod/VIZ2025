plot_missing_values <- function(df, title = 'data name', ...) {
  df |> 
    is.na() |> 
    colMeans() |> 
    t() |> 
    as_tibble() |> 
    pivot_longer(everything()) |> 
    ggplot(aes(value, fct_reorder(name, value))) +
    geom_col() +
    geom_text(aes(label = round(value * 100, 1)),
              hjust = -.1) +
    labs(title = title,
         subtitle = 'Percent of missing values by column',
         x = NULL, y = NULL) +
    scale_x_continuous(expand = expansion(c(0, 0.1))) +
    theme_minimal() +
    theme(
      panel.grid.minor = element_blank(),
      panel.grid.major.y = element_blank(),
      axis.text.x = element_blank()
    )
}