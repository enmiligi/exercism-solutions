
module collatz_conjecture
   implicit none
contains

   integer function steps(i)
      integer, intent(in) :: i
      integer :: n
      n = i
      if (i < 1) then
         steps = -1
      else
         steps = 0
         do
            if (n == 1) exit
            if (mod(n, 2) == 0) then
               n = n/2
            else
               n = 3*n + 1
            end if
            steps = steps + 1
         end do
      end if
   end function

end module
