class AllYourBase {
    def value

    AllYourBase(inputBase, digits) {
        if (inputBase < 2) throw new ArithmeticException()
        value = 0
        for (digit in digits) {
            if (digit < 0 || digit >= inputBase) throw new ArithmeticException()
            value = value * inputBase + digit
        }
    }

    def rebase(outputBase) {
        if (outputBase < 2) throw new ArithmeticException()
        if (value == 0) return [0]
        def result = []
        def v = value
        while (v) {
            result += v % outputBase
            v = v.intdiv(outputBase)
        }
        return result.reverse()
    }
}