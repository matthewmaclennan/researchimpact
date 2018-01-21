#WoSci paragraph
library(XML);library(RCurl);library(httr);
a<-getURL("http://apps.webofknowledge.com/InboundService.do?mode=FullRecord&customersID=Alerting&IsProductCode=Yes&product=WOS&Init=Yes&Func=Frame&DestFail=http%3A%2F%2Fwww.webofknowledge.com&action=retrieve&SrcApp=Alerting&SrcAuth=Alerting&SID=6EwolUr17Pm2nWjaTtV&UT=WOS%3A000419574900008")
a.p<-htmlTreeParse(a,useInternalNode=T)
apv<-unlist(lapply(xpathApply(a.p,"//p[@class]"),xmlValue))
