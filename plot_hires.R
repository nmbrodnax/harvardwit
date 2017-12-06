library(ggplot2)

# load data
it_hires <- read.table("it_hires.dat")
fem_it <- read.table("fem_it_hires.dat")

it_hires$grade <- as.factor(it_hires$grade)

it_hires$variance <- it_hires$mal_hires - it_hires$fem_hires


reqs_female <- data.frame(it_hires[c(1,2,5)], rep('Women', 80))
colnames(reqs_female) <- c('Year', 'Grade', 'Requisitions', 'Gender')

reqs_male <- data.frame(it_hires[c(1,2,6)], rep('Men', 80))
colnames(reqs_male) <- c('Year', 'Grade', 'Requisitions', 'Gender')

reqs_by_gender <- rbind(reqs_female, reqs_male)

trend <- ggplot(data = reqs_by_gender, aes(Grade, Requisitions))

trend + geom_bar(aes(fill = Gender), stat = 'identity') + facet_grid(Year ~ .) +
  ggtitle('IT Requisitions by Gender') + theme(legend.position = 'bottom') +
  ggsave('time_trend.pdf')

diff <- ggplot(data = it_hires, aes(grade, variance))

diff + geom_bar(stat = 'identity', fill = 'gray') + 
  geom_hline(aes(yintercept = 0, color = 'red')) + 
  ggtitle("Female Hires to Parity") +
  facet_grid(year ~ .) + ggsave('time_parity.pdf')
