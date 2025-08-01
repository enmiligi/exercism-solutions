# Convert an integer to a Roman number.
#
# + number - the integer to convert
# + return - the Roman number as a string
function roman(int number) returns string {
    int new_number = number;
    map<int> numerals = {
        M: 1000,
        CM: 900,
        D: 500,
        CD: 400,
        C: 100,
        XC: 90,
        L: 50,
        XL: 40,
        X: 10,
        IX: 9,
        V: 5,
        IV: 4,
        I: 1
    };
    string result = "";
    while new_number >= 1 {
        foreach var numeral in numerals.keys() {
            if new_number >= numerals[numeral] {
                var value = numerals.get(numeral);
                new_number -= value;
                result = result.concat(numeral);
                break;
            }
        }
    }
    return result;
}
