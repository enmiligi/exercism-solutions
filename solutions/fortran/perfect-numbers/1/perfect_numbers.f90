
module perfect_numbers
   implicit none

contains

   character(len=9) function classify(num)
      integer, intent(in) :: num
      integer :: i, sum
      sum = 0
      if (num < 1) then
         classify = "ERROR"
      else
         do i = 1, num - 1
            if (mod(num, i) == 0) then
               sum = sum + i
            end if
         end do
         if (sum == num) then
            classify = "perfect"
         else if (sum > num) then
            classify = "abundant"
         else
            classify = "deficient"
         end if
      end if
   end function

end module
