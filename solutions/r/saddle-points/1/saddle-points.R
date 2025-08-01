saddle_point <- function(input) {
    num_rows <- nrow(input)
    num_cols <- ncol(input)
    if (num_rows == 0 || num_cols == 0) {
        data.frame(row = numeric(), col = numeric())
    } else {
        rows <- numeric()
        cols <- numeric()
        maxperrow <- sapply(1:num_rows, function(row) max(input[row, ]))
        minpercol <- sapply(1:num_cols, function(col) min(input[, col]))
        for (row in 1:num_rows) {
            for (col in 1:num_cols) {
                if (input[row, col] == maxperrow[row] &&
                    input[row, col] == minpercol[col]) {
                    if (!row %in% rows) {
                        rows <- c(rows, row)
                    }
                    if (!col %in% cols) {
                        cols <- c(cols, col)
                    }
                }
            }
        }
        data.frame(row = rows, col = cols)
    }
}
