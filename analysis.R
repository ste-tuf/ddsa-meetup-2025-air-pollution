#' --- 
#' title: DDSA Air pollution walk
#' author: "Stephane Tuffier"
#' date: 2025-03-28
#' ---
#'
#' # DDSA Air pollution walk
#' 
#' Analysis of the Devlabs air pollution monitors
library(tidyverse)

data <- read_delim("data-walk.csv", delim = ";")

# Clean
data <- data |> 
  mutate(
    `Entity Name` = substr(`Entity Name`, 6, 8) |> 
      factor()
  )
data

data_l <- data |> 
  pivot_longer(cols = CO2:`T`, names_to = "Measurement", values_to = "Value" ) |> 
  mutate(Measurement = factor(Measurement,
                              levels = c( "PM2.5", "NO2", "CO2",  "RH", "T", "Light, data, ALL", 
                                          "Light_Blue", "Light_Green", "Light_Red", "Light_White",  "Color, Temp."))
  ) |> 
  filter(!is.na(Measurement))

#' ## Stats
tab_stat <- data_l |> 
  group_by(Measurement) |>
  summarise(
    mean = mean(Value, na.rm = T),
    sd = sd(Value, na.rm = T),
    q1 = quantile(Value, na.rm = T)[2],
    median = median(Value, na.rm = T),
    q3 = quantile(Value, na.rm = T)[4],
    min = min(Value, na.rm = T),
    max = max(Value, na.rm = T),
  )
  
gt::gt(tab_stat) |> 
  gt::fmt_number(decimals = 1, drop_trailing_zeros = T)

#' ## Plots
make_plot <- function(Measurement, data, ...){
  ggplot(data, aes(x = Timestamp, y = Value, colour = Value, group = `Entity Name`)) +
    geom_line(linewidth = 1.5) +
    theme_bw() +
    labs(title = Measurement) +
    scale_color_viridis_c(option = "inferno", direction = -1)

}

data_nested <- data_l |> 
  select(-contains("Accele")) |> 
  group_by(Measurement) |> 
  nest(data = c(`Entity Name`, Timestamp, Value)) |> 
  arrange(Measurement)

data_nested$plot <- pmap(data_nested, make_plot)
  
data_nested$plot

# rmarkdown::render("analysis.R")
