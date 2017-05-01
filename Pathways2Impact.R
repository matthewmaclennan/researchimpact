listy<-list(list())
for(i in 1:36){
listy[[i]]<-htmlTreeParse(getURL(paste0("http://impact.ref.ac.uk/casestudiesapi/REFAPI.svc/SearchCaseStudies?UoA=",
i,"&format=XML")),useInternalNode=T)
}
subjectareas<-unique(unlist(lapply(listy,function(x) xpathApply(x,"//subjectarea",xmlValue))))
#equals 140 subjects total
uoa<-htmlTreeParse(getURL("http://impact.ref.ac.uk/casestudiesapi/REFAPI.svc/ListUnitsOfAssessment?format=XML"),useInternalNode=T)
impacttype<-unique(unlist(lapply(listy,function(x) xpathApply(x,"//impacttype",xmlValue))))
#What are the 60 impact topics? I cannot find them.
