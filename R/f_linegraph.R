#' The function linegraph_all
#'
#'@export

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
