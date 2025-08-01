etl <- function(input) {
  a <- list()
  for (key in names(input)) {
    for (value in input[key]) {
      a[tolower(value)] = as.numeric(key)
    }
  }
  return(a)
}
