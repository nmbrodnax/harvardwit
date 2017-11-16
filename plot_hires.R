library(ggplot2)

# load data
it_hires <- read.table("it_hires.dat")
fem_it <- read.table("fem_it_hires.dat")

it_hires$grade <- as.factor(it_hires$grade)
