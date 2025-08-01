class Squares {
    var squareOfSum: Int
    var sumOfSquares: Int
    var differenceOfSquares: Int
    
    init(_ max: Int) {
        var sum = (1...max).reduce(0, +)
        squareOfSum = sum*sum
        sumOfSquares = (1...max).map {$0*$0}.reduce(0, +)
        differenceOfSquares = squareOfSum - sumOfSquares
    }
}
