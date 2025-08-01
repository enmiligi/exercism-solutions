saddle_point <- function(input) {
    maxperrow <- apply(input, 1, max, -Inf)
    minpercol <- apply(input, 2, min, Inf)
    # matrix of combinations of each max and each min compared with "=="
    # a TRUE in the matrix means this point is a saddle point
    is_saddle_point_matrix <- outer(maxperrow, minpercol, FUN = "==")
    # `which` gives back all the indices which are TRUE in a matrix
    # arr.ind causes `which` to return the x and y indices
    # instead of one single index per point
    data.frame(which(is_saddle_point_matrix, arr.ind = TRUE))
}
