
module armstrong_numbers
  implicit none
contains

  logical function isArmstrongNumber(i)
    integer, intent(in) :: i
    integer :: length
    integer :: j, n, sum
    n = i
    sum = 0
    if (i == 0) then
      isArmstrongNumber = .true.
      return
    end if
    length = int(log10(real(i))) + 1
    do j = 1, length
      sum = sum + mod(n, 10)**length
      n = n/10
    end do
    isArmstrongNumber = sum == i
  end function

end module
