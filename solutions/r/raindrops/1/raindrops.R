raindrops <- function(number) {
  result <- ""
  if (number %% 3 == 0) {
    result <- "Pling"
  }
  if (number %% 5 == 0) {
    result <- paste(result, "Plang", sep="")
  }
  if (number %% 7 == 0) {
    result <- paste(result, "Plong", sep="")
  }
  if (result == "") {
    toString(number)
  } else {
    result
  }
}
