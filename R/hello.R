# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

hello <- function() {
  print("Hello, world!")
}

### packages needed
# library(openxlsx)
# library(tidyverse)

### linegraph function
linegraph_all <- function(name_xlsx_file){
  # import xlsx file and change to tibble
  rend <- read.xlsx("rendement.xlsx")
  rend <- as_tibble(rend)

  # change and structure data
  rend$rendement <- round(100*rend$rendement, 2)
  rend$week <- as.factor(rend$week)
  rend$aandeel <- as.factor(rend$aandeel)
  rend$classif <- as.factor(rend$classif)

  # make plot of all stocks
  ggplot(data = rend, aes(x = week, y = rendement, color = aandeel)) +
    geom_point() + geom_line(aes(group = aandeel))

  # make plot of all stocks separately per classification
  ggplot(data = rend, aes(x = week, y = rendement, color = aandeel)) +
    geom_point() + geom_line(aes(group = aandeel)) + facet_grid(. ~ classif)
}

