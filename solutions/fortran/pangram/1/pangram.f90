module pangram
   implicit none
contains
   logical function is_pangram(sentence)
      character(*) :: sentence
      logical, dimension(26) :: lettersUsed
      integer :: i
      character :: c
      lettersUsed = .false.
      do i = 1, len(sentence)
         c = sentence(i:i)
         if (lge(c, "A") .and. lle(c, "Z")) then
            lettersUsed(ichar(sentence(i:i)) - ichar("A") + 1) = .true.
         else if (lge(c, "a") .and. lle(c, "z")) then
            lettersUsed(ichar(sentence(i:i)) - ichar("a") + 1) = .true.
         end if
      end do
      is_pangram = all(lettersUsed)
   end function is_pangram
end module pangram
