largest_series_product <- function(digits, span) {
    num_windows <- nchar(digits) - span + 1
    if (num_windows < 1 || span < 0) {
        stop()
    }
    max <- 0
    for (i in 1:num_windows) {
        numbers <- list()
        for (c in strsplit(substr(digits, i, i + span - 1), "")) {
            numbers <- strtoi(c)
        }
        product <- prod(numbers)
        if (product > max) {
            max <- product
        }
    }
    max
}
