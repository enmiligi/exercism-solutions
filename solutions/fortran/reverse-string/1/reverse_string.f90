module reverse_string
   implicit none
contains

   function reverse(input) result(reversed)
      character(*), intent(in) :: input
      character(len=len(input)) :: reversed
      integer :: i
      do i = 1, len(input)
         reversed(i:i) = input(len(input) - i + 1:len(input) - i + 1)
      end do
   end function

end module
