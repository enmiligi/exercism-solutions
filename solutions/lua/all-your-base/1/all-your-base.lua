local all_your_base = {}

all_your_base.convert = function(from_digits, from_base)
    if from_base < 2 then
        error('invalid input base')
    end
    local value = 0
    for _, digit in ipairs(from_digits) do
        if digit < 0 then
            error('negative digits are not allowed')
        end
        if digit >= from_base then
            error('digit out of range')
        end
        value = value * from_base
        value = value + digit
    end
    local converter = {}
    converter.to = function(to_base)
        if to_base < 2 then
            error('invalid output base')
        end
        local iter_value = value
        local num_digits = 0
        while iter_value ~= 0 do
            iter_value = iter_value // to_base
            num_digits = num_digits + 1
        end
        iter_value = value
        local result = {}
        for index = 1, num_digits do
            result[num_digits - index + 1] = iter_value % to_base
            iter_value = iter_value // to_base
        end
        if num_digits == 0 then
            result[1] = 0
        end
        return result
    end
    return converter
end

return all_your_base
