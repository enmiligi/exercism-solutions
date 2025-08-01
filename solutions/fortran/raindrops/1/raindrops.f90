module raindrops
   implicit none
contains

   function convert(i)
      integer, intent(in) :: i
      character(20) :: convert
      convert = ""
      if (mod(i, 3) == 0) then
         convert = "Pling"
      end if
      if (mod(i, 5) == 0) then
         convert = trim(convert)//"Plang"
      end if
      if (mod(i, 7) == 0) then
         convert = trim(convert)//"Plong"
      end if
      if (trim(convert) == "") then
         write (convert, '(G0)') i
      end if
   end function convert

end module raindrops
