library(MASS)
require(lme4)
dat <- read.csv("../data/data.csv")
dat[, "X2"] <- dat[, "X2"] + runif(nrow(dat))
dat[, "X5"] <- gl(10, 10)
fit12 <- lm(X1 ~ X2, data = dat)
fit13 <- lm(X1 ~ X3, data = dat)
fit14 <- lm(X1 ~ X4, data = dat)
fit15.reml <- lmer(X1 ~ X2 + (1 | X5), data = dat)
summary(fit15.reml)
tab.12 <- xtable::xtable(summary(fit12))
tab.13 <- xtable::xtable(summary(fit13))
tab.14 <- xtable::xtable(summary(fit14))
tab.15 <- append(fit15.reml, tab.14)
dat <- 25 + 2
dat[2] <- 10
out <- dat * 2
