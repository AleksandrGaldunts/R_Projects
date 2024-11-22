library(haven)
library(dplyr)
library(tidyr)

setwd("/home/alik/workspace/local/R")
dataset <- read_sas("Day13_1.sas7bdat")
print(dataset)

calculate_stats <- function(dataset, variables) {
  stats <- dataset %>%
    summarise(
      across(all_of(variables), list(
        Mean = ~round(mean(., na.rm = TRUE), 2),
        `Std. Dev.` = ~round(sd(., na.rm = TRUE), 2),
        Median = ~round(median(., na.rm = TRUE), 2),
        Min = ~round(min(., na.rm = TRUE), 2),
        Max = ~round(max(., na.rm = TRUE), 2)
      ), .names = "{col}_{fn}")
    )
  
  for (var in variables) {
    stats[[paste0(var, "_MinMax")]] <- paste(stats[[paste0(var, "_Min")]], stats[[paste0(var, "_Max")]], sep = ", ")
    stats[[paste0(var, "_Min")]] <- NULL
    stats[[paste0(var, "_Max")]] <- NULL
  }
  
  stats <- stats %>%
    mutate(across(everything(), as.character))
  
  stats_long <- stats %>%
    pivot_longer(cols = everything(), names_to = c("variable", "statistic"), names_sep = "_") %>%
    pivot_wider(names_from = variable, values_from = value)
  
  n_row <- data.frame(statistic = "N",
                      Invoice = as.character(sum(!is.na(dataset$Invoice))),
                      Horsepower = as.character(sum(!is.na(dataset$Horsepower))),
                      Weight = as.character(sum(!is.na(dataset$Weight))))
  
  result <- bind_rows(n_row, stats_long) %>%
    mutate(statistic = factor(statistic, levels = c("N", "Mean", "Std. Dev.", "Median", "MinMax"))) %>%
    arrange(statistic) %>%
    mutate(statistic = recode(statistic, MinMax = "Min, Max"))
  
  return(result)
}

variables <- c("Invoice", "Horsepower", "Weight")

stats <- calculate_stats(dataset, variables)
print(stats)

