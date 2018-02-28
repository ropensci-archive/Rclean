### Messy code is a fabricated example
### intended to capture the essentials
### of a typical, lazy scripter's R code.
### It is, however, tremendously more 
### organized than the vast majority of
### scripts.

### Depencies are loaded throughout the script.

### Also, some depencies that are loaded are often 
### not used anymore but are still present.
library('gdata')
source("sourced.R")
### Read data from some random file path
### Here, a relative path is being used, but
### typically, file paths are given from root.
data.16 <- read.csv("projects/2016/july_biomass_survey.csv")

### Some datasets are loaded and no longer used.
### Like this one
data.16.2 <- read.csv('projects/data_forestplot/dataset_v2_june_from_collaborator1.csv')

### Create a bunch of intermediate objects
data.v1.1to4 <- data.16[,1:4]
data.v1.1to4. <- data.v1.1to4
data.v1.1to4 <- data.v1.1to4 * 2
data.v1.1to4.2 <- data.v1.1to4 * 2
data.16[,1:4] <- data.v1.1to4.2
library('vegan')
d1 <- vegdist(data.16[,1:2])
d2 <- vegdist(data.16[,2:3])

### Conduct some analyses
mant1 <- mantel(d1,d2)
mant2 <- mantel(d2,d1)
mant11 <- mantel(d1,d1)
fit1 <- lm(Sepal.Length~Sepal.Width,data=data.16)
lm.summary.1 <- summary(fit1)
anova.summary <- anova(fit1)
out.summary <- as.data.frame(anova.summary)

### write some data to file
write.csv(data.v1.1to4,'projects/data_forestplot/save1.csv',row.names = F)

### write lm and anova output to file
capture.output(lm.summary.1, file="analysis_forest/lm_table_1.txt")
write.csv(out.summary, file="analysis_forest/table_2.txt")

### write some figures to file
### Here's another random, unused package
library('txtplot')

png('figures_1/fig1_biplot.png')
plot(data.16[,1:2])
dev.off()

png('figures_1/fig1_biplot_t2.png')
plot(data.16[,1:2]*2)
dev.off()

png('figures_2/fig2_biplot.png')
plot(data.16[,2:3])
dev.off()

