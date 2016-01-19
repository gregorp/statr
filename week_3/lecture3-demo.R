## Lecture 3 Demo
library(dplyr)
library(reshape2)
library(ggplot2)
obese = read.csv("obese11.csv")

sapply(obese, class)

pairs(obese[, -1])

select(obese, -id) %>%
    melt(id = "obese") %>%
    ggplot(aes(x = as.factor(obese))) + facet_wrap(~ variable)

ggplot(data.frame(x = c(-2, 2)), aes(x)) +
    stat_function(fun = arm::invlogit)