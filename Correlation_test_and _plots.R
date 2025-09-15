#Plots
library(ggplot2)
library(broom)
family_data <- read.table "formatted_final_scores.txt", header = TRUE, sep = "\t", stringsAsFactors = FALSE)
colnames(family_data)

# Plotting the mother q score vs the father q scores and running a correlation test
plot(family_data$Mother_q_score, family_data$Father_q_score, xlim = c(0, 1), ylim = c(0, 1), xlab = "Mother q Score", ylab = "Father q score", pch = 19, col = "blue")
abline(lm(family_data$Father_q_score~family_data$Mother_q_score), col = "Black")
cor.test(family_data$Mother_q_score, family_data$Father_q_score, row.names = FALSE)

# Plotting the mother Q12 scores vs the father Q12 scores and running a correlation test
plot(family_data$Mother_Q12, family_data$Father_Q12, xlim = c(0, 1), ylim = c(0, 1), xlab = "Mother Q12", ylab = "Father Q12", pch = 19, col = "blue")
abline(lm(family_data$Father_Q12~family_data$Mother_Q12), col = "Black")
cor.test(family_data$Mother_Q12, family_data$Father_Q12,row.names = FALSE)
