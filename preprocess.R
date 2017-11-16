# converting raw data from "Female IT Hiring Data (2011-2017) acquired
# 11/15/17 17:39:00

# source: Female IT Hires (2011-2017)
year <- c(2017, 2016, 2015, 2014, 2013, 2012, 2011)
pct_fem_it <- c(0.30061, 0.37857, 0.31818, 0.31474, 0.36842, 0.25571, 0.29319)
fem_it_hires <- data.frame(year, pct_fem_it)
write.table(fem_it_hires, file = "fem_it_hires.dat")

# source: IT Hires, Grade (2011-2017)
it_hires <- read.csv("raw/it_hires_by_grade.csv", header = TRUE)
it_hires$fem_hires <- it_hires$pct_female*it_hires$requisitions
it_hires$mal_hires <- it_hires$requisitions - it_hires$fem_hires
write.table(it_hires, file = "it_hires.dat")

# source: % Female Headcount, University-Wide (2012-2017)
univ_hc <- read.csv("raw/hc_by_function.csv", header = TRUE)
univ_hc$total_hc <- as.integer(univ_hc$fem_hc/univ_hc$pct_fem_hc)
univ_hc$mal_hc <- univ_hc$total_hc*(1 - univ_hc$pct_fem_hc)
write.table(univ_hc, file = "univ_hc.dat")
