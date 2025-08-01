"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    all(map(l -> contains(lowercase(input), l), range('a', 'z')))
end

