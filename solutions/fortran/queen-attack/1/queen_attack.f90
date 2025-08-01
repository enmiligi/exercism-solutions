
module queen_attack
   implicit none
contains

   logical function isValid(pos)
      integer, dimension(2) :: pos
      isValid = all(pos >= 1) .and. all(pos <= 8)
   end function

   logical function canAttack(white_pos, black_pos)
      integer, dimension(2) :: white_pos, black_pos
      logical :: sameRow, sameColumn, sameDiag1, sameDiag2
      sameRow = white_pos(2) == black_pos(2)
      sameColumn = white_pos(1) == black_pos(1)
      sameDiag1 = white_pos(1) + white_pos(2) == black_pos(1) + black_pos(2)
      sameDiag2 = white_pos(1) - white_pos(2) == black_pos(1) - black_pos(2)
      canAttack = sameRow .or. sameColumn .or. sameDiag1 .or. sameDiag2
   end function

end module
