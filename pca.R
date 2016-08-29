# Author: Sony Nghiem
# Title: Principle Component Analysis

?swiss
summary(swiss)
apply(swiss, 2, mean)
#a bit different scales or measurement differences
apply(swiss, 2, var)
# a lot of differences in variances
# It needs scaling

pca=prcomp(swiss, scale=TRUE)
pca

attributes(pca)
biplot(pca, scale=0, cex=.7)
# It provides great information about the tendency of so many Swiss provinces
# that has high infant mortality like Porrentruy, Sarine
# high fertility like Glane
# dominant agricultural business like Conthey
# Higher educational level like Beuchatel, La Chauxdnd, and also high military exam score

pca.var = pca$sdev^2
# compute the proportion of variance explained
pv = pca.var/sum(pca.var)
pv
plot(pv, xlab="Principle Component", ylab="Proportion of Variance", type='b', ylim=c(0,1))
# From the scree plot, I "chop" at the elbow. So 2 components would be enough to capture all the variances

