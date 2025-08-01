module difference_of_squares
   implicit none
contains
   integer function square_of_sum(n)
      integer, intent(in) :: n
      integer :: i
      do i = 1, n
         square_of_sum = square_of_sum + i
      end do
      square_of_sum = square_of_sum**2
   end function

   integer function sum_of_squares(n)
      integer, intent(in) :: n
      integer :: i
      do i = 1, n
         sum_of_squares = sum_of_squares + i**2
      end do
   end function

   integer function difference(n)
      integer, intent(in) :: n
      difference = square_of_sum(n) - sum_of_squares(n)
   end function difference

end module difference_of_squares
