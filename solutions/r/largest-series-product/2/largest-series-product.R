largest_series_product <- function(digits, span) {
    digits <- strtoi(strsplit(digits, "")[[1]])
    if (anyNA(digits)) {
        stop("not a digit")
    }
    num_windows <- length(digits) - span + 1
    if (num_windows < 1 || span < 0) {
        stop("span needs to be between 0 and length(digits)")
    }
    if (span == 0) {
        1
    } else {
        max(
            sapply(
                1:num_windows,
                function(index) prod(digits[index:(index + span - 1)])
            )
        )
    }
}
