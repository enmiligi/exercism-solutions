local function flatten(input)
    local result = {}
    local index = 1
    for _, elem in ipairs(input) do
        if type(elem) == "table" then
            for _, inner_elem in ipairs(flatten(elem)) do
                result[index] = inner_elem
                index = index + 1
            end
        else
            result[index] = elem
            index = index + 1
        end
    end
    return result
end

return flatten
