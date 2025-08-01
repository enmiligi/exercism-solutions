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

# Convert an integer to a Roman number.
#
# + number - the integer to convert
# + return - the Roman number as a string
function roman(int number) returns string {
    int new_number = number;
    string result = "";
    foreach var numeral in numerals.keys() {
        var value = numerals.get(numeral);
        while new_number >= value {
            new_number = new_number - value;
            result += numeral;
        }
    }
    return result;
}
