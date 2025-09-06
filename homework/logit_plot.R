library(tidyverse)

titanic <- read.csv("https://sta214-f25.github.io/homework/Titanic.csv")

logodds_plot <- function(data, x, y, group, transform,
                         num_bins = 5, bin_method = "equal_size"){
  
  if(!missing(group)){
    data <- data |>
      mutate({{group}} := as.factor({{group}}))
  }
  
  data |>
    select({{x}}, {{y}}, {{group}}) |>
    arrange({{group}}, {{x}}) |>
    group_by({{group}}) |>
    mutate(bin = rep(1:num_bins, 
                     each=ceiling(n()/num_bins))[1:n()]) |>
    group_by(bin, {{group}}) |>
    summarize({{x}} := mean({{x}}),
              prop = (sum({{y}}) + 0.5)/(n() + 1),
              num_obs = n(),
              .groups = "drop") |>
    mutate(logodds = log(prop/(1 - prop))) |>
    ggplot(aes(x = {{x}},
               y = logodds,
               color = {{group}})) +
    geom_point() +
    geom_smooth(se=F, method="lm", formula = reg_formula) +
    theme_bw() +
    labs(y = "Empirical log odds")
}


logodds_plot <- function(data, reg_formula, group,
                         num_bins = 5){
  
  var_names <- all.vars(reg_formula)

  if(length(var_names) != 2){
    stop("Only one variable can appear on the x-axis")
  }

  if(!is.numeric(data[[var_names[2]]])){
    stop("The explanatory variable must be numeric")
  }
  
  # to do: error message if outcome is not binary
  
  data <- data |>
    select(all_of(var_names), {{group}}) |>
    drop_na()

  dat <- model.frame(reg_formula, data)
  

  xname <- colnames(dat)[2]
  yname <- colnames(dat)[1]
  colnames(dat) <- c("y", "x")

  if(any(is.infinite(dat$x))){
    stop(paste("There are non-finite values in", xname))
  }

  if(!missing(group)){
    dat <- dat |>
      mutate({{group}} := as.factor(data |> pull({{group}})))
  }

  dat |>
    arrange({{group}}, x) |>
    group_by({{group}}) |>
    mutate(bin = rep(1:num_bins,
                     each=ceiling(n()/num_bins))[1:n()]) |>
    group_by(bin, {{group}}) |>
    summarize(x = mean(x),
                prop = (sum(y) + 0.5)/(n() + 1),
                num_obs = n(),
                .groups = "drop") |>
    mutate(logodds = log(prop/(1 - prop))) |>
    ggplot(aes(x = x,
               y = logodds,
               color = {{group}})) +
    geom_point() +
    geom_smooth(se=F, method="lm", formula = y ~ x) +
    theme_bw() +
    labs(x = xname,
         y = "Empirical log odds")
}


logodds_plot(titanic, Survived ~ log(Fare + 1), Pclass,
             num_bins = 20)


logodds_plot(titanic, Survived ~ log(Fare + 1), Pclass)

logodds_plot(titanic, Survived ~ log(Fare), Pclass)

logodds_plot(titanic, Survived ~ Age, 
             Pclass,
             num_bins = 15)



logodds_plot(dengue, Dengue ~ Temperature, num_bins = 20)



logodds_plot(titanic, log(Fare), Survived, Pclass,
             num_bins = 20) +
  facet_wrap(~Pclass)



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
