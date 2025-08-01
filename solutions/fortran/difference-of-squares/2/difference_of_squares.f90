module difference_of_squares
   implicit none
contains
   integer function square_of_sum(n)
      integer, intent(in) :: n
      integer :: i
      square_of_sum = sum([(i, i=1, n)])**2
   end function

   integer function sum_of_squares(n)
      integer, intent(in) :: n
      integer :: i
      sum_of_squares = sum([(i**2, i=1, n)])
   end function

   integer function difference(n)
      integer, intent(in) :: n
      difference = square_of_sum(n) - sum_of_squares(n)
   end function difference

end module difference_of_squares
