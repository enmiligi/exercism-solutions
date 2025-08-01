local function flatten(input)
    local result = {}
    for _, elem in ipairs(input) do
        if type(elem) == "table" then
            for _, inner_elem in ipairs(flatten(elem)) do
                table.insert(result, inner_elem)
            end
        else
            table.insert(result, elem)
        end
    end
    return result
end

return flatten
