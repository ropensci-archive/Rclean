## Make a data frame
mat <- matrix(rnorm(400), nrow = 100)
dat <- as.data.frame(mat)
dat[, "V2"] <- dat[, "V2"] + runif(nrow(dat))
dat[, "V5"] <- gl(10, 10)
## Conduct some analyses
fit12 <- lm(V1 ~ V2, data = dat)
fit13 <- lm(V1 ~ V3, data = dat)
fit14 <- lm(V1 ~ V4, data = dat)
fit15.aov <- aov(V1 ~ V2 + V5, data = dat)
## Summarize analyses
summary(fit15.aov)
tab.12 <- summary(fit12)
tab.13 <- summary(fit13)
tab.14 <- summary(fit14)
tab.15 <- append(fit15.aov, tab.14)
## Conduct an off-hand calculation
dat <- 25 + 2
dat[2] <- 10
out <- dat * 2
