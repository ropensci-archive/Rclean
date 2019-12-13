library(stats)
x <- 1:100
x <- log(x)
x <- x^2
x <- lapply(x, rep, times = 4)
### This is a note that I made for myself.
### Next time, make sure to use a different analysis.
### Also, check with someone about how to run some other analysis.
x <- do.call(cbind, x)

### Now I'm going to create a different variable.
### This is the best variable the world has ever seen.

x2 <- sample(10:1000, 100)
x2 <- lapply(x2, rnorm)

### Wait, now I had another thought about x that I want to work through.

x <- x * 2
colnames(x) <- paste0("X", seq_len(ncol(x)))
rownames(x) <- LETTERS[seq_len(nrow(x))]
x <- t(x)
x[, "A"] <- sqrt(x[, "A"])

for (i in seq_along(colnames(x))){
    set.seed(17)
    x[, i] <- x[, i] + runif(length(x[, i]), -1, 1)
}

### Ok. Now I can get back to x2.
### Now I just need to check out a bunch of stuff with it.

lapply(x2, length)[1]
max(unlist(lapply(x2, length)))
range(unlist(lapply(x2, length)))
head(x2[[1]])
tail(x2[[1]])

## Now, based on that stuff, I need to subset x2.

x2 <- lapply(x2, function(x) x[1:10])

## And turn it into a matrix.
x2 <- do.call(rbind, x2)

## Now, based on x2, I need to create x3.
x3 <- x2[, 1:2]
x3 <- apply(x3, 2, round, digits = 3)

## Oh wait! Another thought about x.

x[, 1] <- x[, 1] * 2 + 10
x[, 2] <- x[, 1] + x[, 2]
x[, "A"] <- x[, "A"]^2

## Now, I want to run an analysis on two variables in x2 and x3.

fit.23 <- lm(x2 ~ x3, data = data.frame(x2[, 1], x3[, 1]))
summary(fit.23)

## And while I'm at it, I should do an analysis on x.

x <- data.frame(x)
fit.xx <- lm(A~B, data = x)
summary(fit.xx)
shapiro.test(residuals(fit.xx))

## Ah, it looks like I should probably transform A.
## Let's try that.
fit.sqrt.A <- lm(I(sqrt(A))~B, data = x)
summary(fit.sqrt.A)
shapiro.test(residuals(fit.sqrt.A))

## Looks good!

## After that. I came back and ran another analysis with 
## x2 and a new variable.

z <- c(rep("A", nrow(x2)/2), rep("B", nrow(x2)/2))
fit.anova <- aov(x2 ~ z, data = data.frame(x2 = x2[, 1], z))
summary(fit.anova)
