REFdf<-data_frame(line=1:length(REFimpactSentence),text=unlist(REFimpactSentence))

tfidf<-function(REFdf){
REFdft<- REFdf %>%
 unnest_tokens(word, text) %>%
   anti_join(stop_words)

REFdftw<-REFdft %>% 
 count(line , word, sort = TRUE) %>% 
 ungroup()

REFdftwt<-REFdftw %>% 
 group_by(line) %>% 
 summarize(total = sum(n))

REFdftw<-left_join(REFdftw,REFdftwt)

REFdftw<-bind_tf_idf(REFdftw,line,word,n)

REFdftw %>%
 select(-total) %>%
 arrange(desc(tf_idf))

}
