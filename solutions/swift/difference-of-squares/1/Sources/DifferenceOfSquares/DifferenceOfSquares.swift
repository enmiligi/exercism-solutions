class Squares {
    var squareOfSum: Int
    var sumOfSquares: Int
    var differenceOfSquares: Int
    
    init(_ max: Int) {
        squareOfSum = 0
        sumOfSquares = 0
        for i in 1...max {
            squareOfSum += i
            sumOfSquares += i*i
        }
        squareOfSum *= squareOfSum
        differenceOfSquares = squareOfSum - sumOfSquares
    }
}
