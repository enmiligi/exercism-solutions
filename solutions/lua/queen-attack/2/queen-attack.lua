local function valid(pos)
    return (pos.row >= 0 and pos.row < 8
        and pos.column >= 0 and pos.column < 8)
end

return function(pos)
    if not valid(pos) then
        error("Position is not valid!")
    end
    return {
        pos = pos,
        can_attack = function(queen2)
            local pos2 = queen2.pos
            if not valid(pos2) then
                error("Position is not valid!")
            end
            local same_row = pos.row == pos2.row
            local same_column = pos.column == pos2.column
            local same_diagonal1 = pos.row - pos.column == pos2.row - pos2.column
            local same_diagonal2 = pos.row + pos.column == pos2.row + pos2.column
            return same_row or same_column or same_diagonal1 or same_diagonal2
        end
    }
end
