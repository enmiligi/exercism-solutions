etl <- function(input) {
  res <- list()
  for (key in names(input)) {
      for (value in input[key]) {
        res[tolower(value)] = as.numeric(key)
      }
  }
  res[order(names(res))]
}
