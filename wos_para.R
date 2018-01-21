#WoSci paragraph
wosci<-function(url){
library(XML);library(RCurl);library(httr);
a<-getURL(url)
a.p<-htmlTreeParse(a,useInternalNode=T)
apv<-unlist(lapply(xpathApply(a.p,"//p[@class]"),xmlValue))
abstract<-apv[grep("^[A-Za-z]",apv)][3]
}
