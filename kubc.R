#knot, kchal, uchal represent statements concerning challenges to UBC, KMb and notions of KMb.
ubc<-rbind(knot[,1:2],kchal[,1:2],uchal[,1:2])
ubc[,2]<-gsub("^[0-9]{,2}\\.\\s+|[a-z]\\.\\s{2,}","",ubc[,2])
