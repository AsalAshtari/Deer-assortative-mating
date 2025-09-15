
#Plots
library(ggplot2)
library(broom)
family_data <- read.table "formatted_final_scores.txt", header = TRUE, sep = "\t", stringsAsFactors = FALSE)
colnames(family_data)

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
