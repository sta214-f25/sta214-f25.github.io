library(tidyverse)

logodds_plot <- function(data, x, y, group = NULL,
                         num_bins = 5, bin_method = "equal_size",
                         reg_formula = y ~ x){
  
  data |>
    select({{x}}, {{y}}, {{group}}) |>
    arrange({{group}}, {{x}}) |>
    group_by({{group}}) |>
    mutate(bin = rep(1:num_bins, 
                     each=ceiling(n()/num_bins))[1:n()]) |>
    group_by(bin, {{group}}) |>
    summarize({{x}} := mean({{x}}),
              prop = mean({{y}}),
              num_obs = n()) |>
    ungroup() #|>
    # mutate(logodds = log(prop/(1 - prop))) |>
    # ggplot(aes(x = {{x}},
    #            y = logodds, 
    #            color = as.factor({{group}}))) +
    # geom_point()
}


logodds_plot(titanic, Fare, Survived, Pclass) |>
ggplot(aes(x = mean_x,
           y = logodds)) +
  geom_point()

logodds_plot <- function(data, num_bins, bin_method,
                         x_name, y_name, grouping = NULL, 
                         reg_formula = y ~ x){
  
  if(is.null(grouping)){
    dat <- data.frame(x = data |> pull(x_name), 
                      y = data |> pull(y_name),
                      group = 1)
  } else {
    dat <- data.frame(x = data |> pull(x_name), 
                      y = data |> pull(y_name),
                      group = as.factor(data |> pull(grouping)))
  }
  
  if(bin_method == "equal_size"){
    logodds_table <- dat |>
      drop_na() |>
      arrange(group, x) |>
      group_by(group) |>
      mutate(obs = y,
             bin = rep(1:num_bins,
                       each=ceiling(n()/num_bins))[1:n()]) |>
      group_by(bin, group) |>
      summarize(mean_x = mean(x),
                prop = mean(c(obs, 0.5)),
                num_obs = n()) |>
      ungroup() |>
      mutate(logodds = log(prop/(1 - prop)))
  } else {
    logodds_table <- dat |>
      drop_na() |>
      group_by(group) |>
      mutate(obs = y,
             bin = cut(x, 
                       breaks = num_bins,
                       labels = F)) |>
      group_by(bin, group) |>
      summarize(mean_x = mean(x),
                prop = mean(c(obs, 0.5)),
                num_obs = n()) |>
      ungroup() |>
      mutate(logodds = log(prop/(1 - prop)))
  }
  
  if(is.null(grouping)){
    p <- logodds_table |>
      ggplot(aes(x = mean_x,
                 y = logodds))
  } else {
    p <- logodds_table |>
      ggplot(aes(x = mean_x,
                 y = logodds,
                 color = group,
                 shape = group)) +
      labs(color = grouping,
           shape = grouping)
  }
  
  p + 
    geom_point() +
    geom_smooth(se=F, method="lm", formula = reg_formula) +
    theme_bw() +
    labs(x = x_name, 
         y = "Empirical log odds")
}

logodds_plot(titanic, 30, "equal_size", "Fare", "Survived", reg_formula = y ~ x)
