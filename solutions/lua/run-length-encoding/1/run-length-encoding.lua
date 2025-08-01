return {
  encode = function(s)
    local last_char = ""
    local count = 1
    local result = ""
    for index = 1, #s + 1 do
      local char = s:sub(index, index)
      if (last_char == char) then
        count = count + 1
      else
        if count == 1 then
          result = result .. last_char
        else
          result = result .. tostring(count) .. last_char
        end
        last_char = char
        count = 1
      end
    end
    return result
  end,

  decode = function(s)
    local count = 0
    local result = ""
    for i = 1, #s do
      local char = s:sub(i, i)
      local digit = tonumber(char)
      if digit == nil then
        if count == 0 then
          result = result .. char
        else
          result = result .. char:rep(count)
        end
        count = 0
      else
        count = count * 10 + digit
      end
    end
    return result
  end
}
