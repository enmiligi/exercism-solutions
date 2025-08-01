
module acronym
   implicit none
contains
   character function to_uppercase(c)
      character, intent(in) :: c
      if (lge(c, "a") .and. lle(c, "z")) then
         to_uppercase = char(ichar(c) - ichar("a") + ichar("A"))
      else
         to_uppercase = c
      end if
   end function

   function abbreviate(s)
      character(len=*), intent(in) :: s
      character(len=len_trim(s)) :: abbreviate
      logical :: wasSplitChar
      integer :: i
      abbreviate = ""
      wasSplitChar = .true.
      do i = 1, len(s)
         select case (s(i:i))
         case (" ", "_", "-")
            wasSplitChar = .true.
         case default
            if (wasSplitChar) then
               abbreviate = trim(abbreviate)//to_uppercase(s(i:i))
               wasSplitChar = .false.
            end if
         end select
      end do
   end function

end module
