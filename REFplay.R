#A' cluiche le REF
#Playing with REF
#Put all REF statements into a tidy-format corpus (data frame)


REFdf<-data_frame(line=1:length(REFimpactSentence),text=unlist(REFimpactSentence))

# all 2-grams (i.e. 2 word phrases that appear across all REF studies)
library(dplyr)
library(tidytext)
REFdfBigrams <- REFdf %>%
  unnest_tokens(bigram, text, token = "ngrams", n = 2)

REFdfBigrams

#Sort from most frequent to least
REFdfBigrams %>% count(bigram, sort = TRUE)

#Tidy up the bigrams to remove stopwords
library(tidyr)

bigrams_separated <- REFdfBigrams %>%
  separate(bigram, c("word1", "word2"), sep = " ")

bigrams_filtered <- bigrams_separated %>%
  filter(!word1 %in% stop_words$word) %>%
  filter(!word2 %in% stop_words$word)

# new bigram counts:
bigram_counts <- bigrams_filtered %>% 
  count(word1, word2, sort = TRUE)

bigram_counts

#Work with the recombined words co-dhiù
bigrams_united <- bigrams_filtered %>%
  unite(bigram, word1, word2, sep = " ")

bigrams_united

# most common 3-grams not containing stopwords (i.e. 3 word phrases that appear most often across 
# all REF studies that don't contain common words like 'the', 'as', 'with', etc...)
REFdf3grams<- REFdf %>% 
 unnest_tokens(trigram, text, token = "ngrams", n = 3) %>%
  separate(trigram, c("word1", "word2", "word3"), sep = " ") %>%
  filter(!word1 %in% stop_words$word,
         !word2 %in% stop_words$word,
         !word3 %in% stop_words$word) %>%
  count(word1, word2, word3, sort = TRUE)

REFdf3grams

# most common 4-grams not containing stopwords (i.e. 4 word phrases that appear most often across 
# all REF studies that don't contain common words like 'the', 'as', 'with', etc...)
REFdf4grams<- REFdf %>% 
  unnest_tokens(trigram, text, token = "ngrams", n = 4) %>%
   separate(trigram, c("word1", "word2", "word3", "word4"), sep = " ") %>%
   filter(!word1 %in% stop_words$word,
          !word2 %in% stop_words$word,
          !word3 %in% stop_words$word,
          !word4 %in% stop_words$word) %>%
   count(word1, word2, word3, word4, sort = TRUE)

REFdf4grams

#tf-idf is the frequency of a term adjusted for how rarely it is used.
bigram_tf_idf <- bigrams_united %>%
count(line,bigram) %>%
bind_tf_idf(bigram, line, n) %>%
arrange(desc(tf_idf))

bigram_tf_idf
