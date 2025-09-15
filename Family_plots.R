q_score <- read.csv("mother_foetus_Qadmixture.txt", header = FALSE, sep = "")
Q12 <- read.csv("outputestpost_allQ12.txt", header = FALSE)

colnames(q_score)
head(q_score)
head(Q12)
Q12_mean_values <- Q12[, 2, drop = FALSE]
head(Q12_mean_values)
q_score_mean_values <- q_score[, 2, drop = FALSE]
head(q_score_mean_values)

colnames(q_score_mean_values) <- c("q_score")
colnames(Q12_mean_values) <- c("Q12")

num_families <- nrow(q_score_mean_values) / 3  
print(family_ids)

family_ids <- rep(1:num_families, each = 3)
q_score_mean_values$Family_id <- family_ids
Q12_mean_values$Family_id <- family_ids

roles <- rep(c("mother", "foetus", "father"), times = num_families)
q_score_mean_values$role <- roles
Q12_mean_values$role <- roles
print(combined_data)


combined_data <- cbind(q_score_mean_values, Q12 = Q12_mean_values$Q12)
colnames(combined_data)

formatted_data <- reshape(combined_data, timevar = "role", idvar = "Family_id", direction = "wide")

colnames(formatted_data) <- c("Family_id","Mother_q_score", "Mother_Q12","Foetus_q_score", "Foetus_Q12","Father_q_score", "Father_Q12")

write.table(formatted_data, "formatted_final_scores.txt", row.names = FALSE, quote = FALSE, sep = "\t")


#Plots
library(ggplot2)
library(broom)
family_data <- read.table("test_scores.txt", header = TRUE, sep = "\t", stringsAsFactors = FALSE)
colnames(family_data)

# Plotting the mother q score vs the father q scores and running a correlation test
plot(family_data$Mother_q_score, family_data$Father_q_score, xlim = c(0, 1), ylim = c(0, 1), xlab = "Mother q Score", ylab = "Father q score", pch = 19, col = "blue")
abline(lm(family_data$Father_q_score~family_data$Mother_q_score), col = "Black")
cor.test(family_data$Mother_q_score, family_data$Father_q_score, row.names = FALSE)

# Plotting the mother Q12 scores vs the father Q12 scores and running a correlation test
plot(family_data$Mother_Q12, family_data$Father_Q12, xlim = c(0, 1), ylim = c(0, 1), xlab = "Mother Q12", ylab = "Father Q12", pch = 19, col = "blue")
abline(lm(family_data$Father_Q12~family_data$Mother_Q12), col = "Black")
cor.test(family_data$Mother_Q12, family_data$Father_Q12,row.names = FALSE)

# Sort the data by Mother_q_score in increasing order
family_data_sorted <- family_data[order(family_data$Mother_q_score), ]
num_families <- nrow(family_data_sorted)  
bin_sizes <- c(8, 8, 8, 7) 

#  Assign bin numbers to each family
family_data_sorted$Bin <- rep(1:4, times = bin_sizes)
print(table(family_data_sorted$Bin)) 
head(bin_data)


family_data$Bin <- cut(family_data$Mother_q_score, 
                       breaks = quantile(family_data$Mother_q_score, probs = seq(0, 1, by = 0.25), na.rm = TRUE), 
                       include.lowest = TRUE, 
                       labels = c("Bin 1", "Bin 2", "Bin 3", "Bin 4"))


#Triangle plot for Bin 4
family_data$Bin <- as.character(family_data$Bin)
bin_data <- subset(family_data, Bin == "Bin 4")
triangle_cols <- rainbow(nrow(bin_data))

# Empty plot
plot(0, type = "n", xlab = "q", ylab = "Q12", xlim = c(0, 1), ylim = c(0, 1), las = 1, cex.lab = 1.5, cex.axis = 1.25)

# Triangle segments
segments(0, 0, 0.5, 1, lwd = 3)
segments(1, 0, 0.5, 1, lwd = 3)
for (i in 1:nrow(bin_data)) {
  points(bin_data$Mother_q_score[i], bin_data$Mother_Q12[i],
         pch = 21, bg = adjustcolor(triangle_cols[i], alpha.f = 0.75), cex = 1.5)
  points(bin_data$Foetus_q_score[i], bin_data$Foetus_Q12[i],
         pch = 22, bg = adjustcolor(triangle_cols[i], alpha.f = 0.75), cex = 1.5)
  points(bin_data$Father_q_score[i], bin_data$Father_Q12[i],
         pch = 24, bg = adjustcolor(triangle_cols[i], alpha.f = 0.75), cex = 1.5)}

#Triangle plot for Bin 3
bin_data <- subset(family_data, Bin == "Bin 3")
triangle_cols <- rainbow(nrow(bin_data))

plot(0, type = "n", xlab = "q", ylab = "Q12", xlim = c(0, 1), ylim = c(0, 1), las = 1, cex.lab = 1.5, cex.axis = 1.25)
segments(0, 0, 0.5, 1, lwd = 3)
segments(1, 0, 0.5, 1, lwd = 3)
for (i in 1:nrow(bin_data)) {
  points(bin_data$Mother_q_score[i], bin_data$Mother_Q12[i],
         pch = 21, bg = adjustcolor(triangle_cols[i], alpha.f = 0.75), cex = 1.5)
  points(bin_data$Foetus_q_score[i], bin_data$Foetus_Q12[i],
         pch = 22, bg = adjustcolor(triangle_cols[i], alpha.f = 0.75), cex = 1.5)
  points(bin_data$Father_q_score[i], bin_data$Father_Q12[i],
         pch = 24, bg = adjustcolor(triangle_cols[i], alpha.f = 0.75), cex = 1.5)}

#Triangle plot for Bin 2
bin_data <- subset(family_data, Bin == "Bin 2")
triangle_cols <- rainbow(nrow(bin_data))

plot(0, type = "n", xlab = "q", ylab = "Q12", xlim = c(0, 1), ylim = c(0, 1), las = 1, cex.lab = 1.5, cex.axis = 1.25)
segments(0, 0, 0.5, 1, lwd = 3)
segments(1, 0, 0.5, 1, lwd = 3)
for (i in 1:nrow(bin_data)) {
  points(bin_data$Mother_q_score[i], bin_data$Mother_Q12[i],
         pch = 21, bg = adjustcolor(triangle_cols[i], alpha.f = 0.75), cex = 1.5)
  points(bin_data$Foetus_q_score[i], bin_data$Foetus_Q12[i],
         pch = 22, bg = adjustcolor(triangle_cols[i], alpha.f = 0.75), cex = 1.5)
  points(bin_data$Father_q_score[i], bin_data$Father_Q12[i],
         pch = 24, bg = adjustcolor(triangle_cols[i], alpha.f = 0.75), cex = 1.5)}

#Triangle plot for Bin 1
bin_data <- subset(family_data, Bin == "Bin 1")
triangle_cols <- rainbow(nrow(bin_data))

plot(0, type = "n", xlab = "q", ylab = "Q12", xlim = c(0, 1), ylim = c(0, 1), las = 1, cex.lab = 1.5, cex.axis = 1.25)
segments(0, 0, 0.5, 1, lwd = 3)
segments(1, 0, 0.5, 1, lwd = 3)
for (i in 1:nrow(bin_data)) {
  points(bin_data$Mother_q_score[i], bin_data$Mother_Q12[i],
         pch = 21, bg = adjustcolor(triangle_cols[i], alpha.f = 0.75), cex = 1.5)
  points(bin_data$Foetus_q_score[i], bin_data$Foetus_Q12[i],
         pch = 22, bg = adjustcolor(triangle_cols[i], alpha.f = 0.75), cex = 1.5)
  points(bin_data$Father_q_score[i], bin_data$Father_Q12[i],
         pch = 24, bg = adjustcolor(triangle_cols[i], alpha.f = 0.75), cex = 1.5)}
