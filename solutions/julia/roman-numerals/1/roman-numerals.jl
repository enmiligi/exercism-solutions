const ROMAN_NUMERALS =
    [
        1000 => "M", 900 => "CM",
        500 => "D", 400 => "CD",
        100 => "C", 90 => "XC",
        50 => "L", 40 => "XL",
        10 => "X", 9 => "IX",
        5 => "V", 4 => "IV",
        1 => "I"
    ]

function replicateNumeral(number_converted, numeral)
    number = number_converted.first
    converted = number_converted.second

    to_add = numeral.second^div(number, numeral.first)

    return rem(number, numeral.first) => (converted * to_add)
end

function to_roman(number)
    if number == 0
        throw(ErrorException("Number can't be zero!"))
    elseif number < 0
        throw(ErrorException("Number can't be negative!"))
    end
    return foldl(replicateNumeral, ROMAN_NUMERALS; init=number => "").second
end
