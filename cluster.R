## K-Means Clustering

# for 2 clusters
km = kmeans(swiss, centers = 2, nstart=20)
km$cluster

# for 3 clusters
km2 = kmeans(swiss, centers = 3, nstart=20)
km2$cluster

par(mfrow=c(2,2))
plot(c(swiss$Fertility, swiss$Catholic), col=km$cluster+1, pch=19)
plot(c(swiss$Agriculture, swiss$Examination), col=km$cluster+1, pch=19)
plot(c(swiss$Infant.Mortality, swiss$Education), col=km$cluster+1, pch=19)
plot(c(swiss$Education, swiss$Examination), col=km$cluster+1, pch=19)

## Hierarchical Clustering
hc.complete = hclust(dist(swiss), method="complete")
hc.average = hclust(dist(swiss), method="average")
par(mfrow=c(1,2))
plot(hc.complete, main="Complete linkage")
plot(hc.average, main="Average linkage")

# 4 clusters are good enough I think
hc1 = cutree(hc.complete, 4)
hc2 = cutree(hc.average, 4)
table(hc1, hc2)
# they are doing pretty okay, especially the cluster 2 from each
table(km$cluster, hc1)
# they are quite equivalent for this comparison
# hc1's cluster 3 like km's cluster 1
# hc1's cluster 2 like km's cluster 3
