sum_of_multiples <- function(factors, limit) {
    multiples_per_factor <- sapply(
        factors,
        function(factor) seq(from = 0, to = limit - 1, by = factor)
    )
    multiples <- unique(unlist(multiples_per_factor))
    sum(multiples)
}
