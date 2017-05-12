#A' cluiche le REF
#Playing with REF
#Put all REF statements into a tidy-format corpus (data frame)


REFdf<-data_frame(line=1:length(REFimpactSentence),text=unlist(REFimpactSentence))


REFdf %>% 
  unnest_tokens(trigram, text, token = "ngrams", n = 4) %>%
   separate(trigram, c("word1", "word2", "word3", "word4"), sep = " ") %>%
   filter(!word1 %in% stop_words$word,
          !word2 %in% stop_words$word,
          !word3 %in% stop_words$word,
          !word4 %in% stop_words$word) %>%
   count(word1, word2, word3, word4, sort = TRUE)
