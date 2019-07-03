mat <- matrix(rnorm(400), nrow = 100)
dat <- as.data.frame(mat)
dat[, "V2"] <- dat[, "V2"] + runif(nrow(dat))
dat[, "V5"] <- gl(10, 10)
dat <- 25 + 2
dat[2] <- 10
out <- dat * 2
