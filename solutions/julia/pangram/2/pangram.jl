"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    all(in(lowercase(input)), range('a', 'z'))
end

