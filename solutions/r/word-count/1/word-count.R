word_count <- function(input) {
    input <- tolower(input)
    expr <- gregexpr("[[:alnum:]]+", input, perl = TRUE)
    words <- unlist(regmatches(input, expr))
    count <- list()
    for (word in words) {
        if (word %in% names(count)) {
            count[word] <- count[[word]] + 1
        } else {
            count[word] <- 1
        }
    }
    count
}
