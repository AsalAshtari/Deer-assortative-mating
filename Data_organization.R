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

