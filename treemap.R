#testing
library(treemap)
tg<-random.hierarchical.data(20,number.children=7)
treemap(tg,index=colnames(tg),"x")
