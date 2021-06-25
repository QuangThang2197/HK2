
install.packages('igraph')
library(igraph)

# Vo Huong

edges <- c(1,2, 3,2, 2,4)
g<-graph(edges, n=max(edges), directed=FALSE)
plot(g)


