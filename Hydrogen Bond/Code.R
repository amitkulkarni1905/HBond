#Loading the data
library(caret)

df<- read.csv("C:/Users/Amit R Kulkarni/Desktop/Hydrogen Bond/Dataset.csv");

preproc2 <- preProcess(df, method=c("range"))

norm2 <- predict(preproc2, df);

set.seed(123)
km.res <- kmeans(norm2, 3, nstart = 25)
# Visualize
library("factoextra")
fviz_cluster(km.res, data = norm2,
             ellipse.type = "convex",
             palette = "jco",
             ggtheme = theme_minimal())


library(clValid)

v <- clValid( norm2, nClust=3, clMethods = "kmeans", validation =
                "internal")
plot(v)