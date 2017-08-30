library(ngram)

orderedNgrams2 <- readRDS('./orderedNgrams2.rds')
orderedNgrams3 <- readRDS('./orderedNgrams3.rds')
orderedNgrams4 <- readRDS('./orderedNgrams4.rds')
orderedNgrams5 <- readRDS('./orderedNgrams5.rds')

preProcessar <- function(x){
  preprocess(x, case = "lower", remove.punct = TRUE,
             remove.numbers = TRUE, fix.spacing = TRUE)
}

countWords <- function(x){
  wordCount <- sapply(gregexpr("\\S+", x), length)
  wordCount
}

predictNextWord <- function(input){
  input <- preProcessar(input)
  wordCount <- countWords(input)
  
  if (nchar(input) == 0) {
    result <- 'Waiting for text to predict next word'
    return(result)
  }
  if (wordCount == 1){
    order <- grep(paste0('^', input, ' '), orderedNgrams2)
    bestMatch <- orderedNgrams2[order[1]]
  } else if (wordCount == 2) {
    order <- grep(paste0('^', input, ' '), orderedNgrams3)
    bestMatch <- orderedNgrams3[order[1]]
  } else if (wordCount == 3) {
    order <- grep(paste0('^', input, ' '), orderedNgrams4)
    bestMatch <- orderedNgrams4[order[1]]
  } else if (wordCount == 4) {
    order <- grep(paste0('^', input, ' '), orderedNgrams5)
    bestMatch <- orderedNgrams5[order[1]]
  } else if (wordCount >= 5) {
    cut <- unlist(strsplit(input, ' '))
    newInput <- concatenate(cut[(length(cut)-3):length(cut)])
    bestMatch <- predictNextWord(newInput)
  } else {
    print('error')
  }
  
  brokenString <- unlist(strsplit(bestMatch, ' '))
  result <- brokenString[length(brokenString)]
  if(is.na(result)){
    cut <- unlist(strsplit(input, ' '))
    brandNewInput <- concatenate(cut[-1])
    bestMatch <- predictNextWord(brandNewInput)
    brokenString <- unlist(strsplit(bestMatch, ' '))
    result <- brokenString[length(brokenString)]
  }
  
  result
}
