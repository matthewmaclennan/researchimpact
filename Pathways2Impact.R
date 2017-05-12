listy<-list(list())
for(i in 1:36){
listy[[i]]<-htmlTreeParse(getURL(paste0("http://impact.ref.ac.uk/casestudiesapi/REFAPI.svc/SearchCaseStudies?UoA=",
i,"&format=XML")),useInternalNode=T)
}
subjectareas<-unique(unlist(lapply(listy,function(x) xpathApply(x,"//subjectarea",xmlValue))))
#equals 140 subjects total
REF<-htmlTreeParse(getURL("http://impact.ref.ac.uk/casestudiesapi/REFAPI.svc/ListUnitsOfAssessment?format=XML"),useInternalNode=T)
impacttype<-unique(unlist(lapply(listy,function(x) xpathApply(x,"//impacttype",xmlValue))))
#

#########################################################################################################                                 
REF<-htmlTreeParse("C:\\Users\\newguy\\Documents\\2014 REF\\CaseStudies.html",useInternalNode=T)
#isolate impact reports
REFimpact<-xpathApply(REF,"//div[@class='col-lg-12 impact readmore']",xmlValue)
#Tidy up
#REFimpactTidy<-lapply(REFimpact,function(x) strsplit(x,"\r\n"))
REFimpactTidy<-lapply(REFimpact,function(x) strsplit(x,"(\r)+\\s*|(\n)+\\s*|(\n)$|(\r)$"))
REFimpactTidy<-lapply(REFimpactTidy,function(x) strsplit(x[[1]],"(\r)+\\s*"))
REFimpactTidy<-lapply(REFimpactTidy,function(x) strsplit(x[[1]],"(\n)+\\s*"))
REFimpactSentence<-lapply(REFimpactTidy,function(x)paste0(x[[1]][-1],sep="",collapse=" "))
REFimpactSent<-lapply(REFimpactSentence,function(x) strsplit(x[[1]],"(?<=\\. )",perl=T))  
#
########################################################################################################
