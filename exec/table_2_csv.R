data.16 <- read.csv("../data/projects/2016/july_biomass_survey.csv")
data.v1.1to4 <- data.16[, 1:4]
data.v1.1to4 <- data.v1.1to4 * 2
data.v1.1to4.2 <- data.v1.1to4 * 2
data.16[, 1:4] <- data.v1.1to4.2
fit1 <- lm(Sepal.Length ~ Sepal.Width, data = data.16)
anova.summary <- anova(fit1)
out.summary <- as.data.frame(anova.summary)
write.csv(out.summary, file = "../data/projects/table_2.csv")
