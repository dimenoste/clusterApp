## check and install packages if not installed
list.of.packages <- c("ggplot2", "dplyr", "Rtsne", "cluster", "tidyverse", "plotly", "shinytest", "shiny")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

require(shiny)

## load libraries
lapply(list.of.packages, library, character.only = TRUE)
shinytest::installDependencies()