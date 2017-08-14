### Make two figures

## Data handling
x <- read.csv("data/simple_data.csv")
x. <- data.frame(x, y2 = x[,"y"]^2)

## Stats
fit <- lm(x~y, data = x)
stat.tab <- capture.output(summary(fit))
stat.tab <- as.matrix(stat.tab)

## Producing output
write.csv(stat.tab, 
          file = "results/stats_table.csv")

png("results/plot_xy.png")
plot(y~x, 
     data = x)
dev.off()

png("results/plot_xy2.png")
plot(y2~x, 
     data = x.)
dev.off()
