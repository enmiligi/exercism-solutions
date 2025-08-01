word_count <- function(input) {
    words <- strsplit(tolower(input), "\\W+")[[1]]
    as.list(table(words[!words == ""]))
}
