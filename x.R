mat <- matrix(rnorm(400), nrow = 100)
dat <- as.data.frame(mat)
dat[, "V2"] <- dat[, "V2"] + runif(nrow(dat))
dat[, "V5"] <- gl(10, 10)
fit14 <- lm(V1 ~ V4, data = dat)
fit15.aov <- aov(V1 ~ V2 + V5, data = dat)
tab.14 <- summary(fit14)
tab.15 <- append(fit15.aov, tab.14)
dat <- 25 + 2
dat[2] <- 10
