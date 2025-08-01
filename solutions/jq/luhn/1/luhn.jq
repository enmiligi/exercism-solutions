def calculate_sum:
    if length == 0 then 0
    elif length == 1 then .[0]
    else (.[-2] * 2 | if . > 9 then . - 9 else . end)
             + .[-1] + (.[:-2] | calculate_sum) end
;

if test("[^0-9\\s]") then false
else gsub("\\s"; "") | ./"" |
    if length <= 1 then false
    else map(tonumber) | calculate_sum % 10 == 0 end
end
