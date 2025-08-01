
module rational_numbers
   implicit none
contains

   function add(r1, r2)
      integer, dimension(2) :: add
      integer, dimension(2), intent(in) :: r1, r2
      add(1) = r1(1)*r2(2) + r2(1)*r1(2)
      add(2) = r1(2)*r2(2)
      add = reduce(add)
   end function

   function sub(r1, r2)
      integer, dimension(2) :: sub
      integer, dimension(2), intent(in) :: r1, r2
      sub = add(r1, [-r2(1), r2(2)])
   end function

   function mul(r1, r2)
      integer, dimension(2) :: mul
      integer, dimension(2), intent(in) :: r1, r2
      mul = reduce(r1*r2)
   end function

   function div(r1, r2)
      integer, dimension(2) :: div
      integer, dimension(2), intent(in) :: r1, r2
      div = reduce(r1*r2(2:1:-1))
   end function

   function rational_abs(r1)
      integer, dimension(2) :: rational_abs
      integer, dimension(2), intent(in) :: r1
      rational_abs = reduce(abs(r1))
   end function

   function rational_to_pow(r1, ex)
      integer, dimension(2) :: rational_to_pow
      integer, dimension(2), intent(in) :: r1
      integer, intent(in) :: ex
      if (ex >= 0) then
         rational_to_pow = r1**ex
      else
         rational_to_pow = r1(2:1:-1)**abs(ex)
      end if
      rational_to_pow = reduce(rational_to_pow)
   end function

   function real_to_rational_pow(ex, r1)
      integer, dimension(2), intent(in) ::  r1
      real :: real_to_rational_pow
      real, intent(in) :: ex
      real_to_rational_pow = ex**(real(r1(1))/real(r1(2)))
   end function

   function reduce(r1)
      integer, dimension(2) :: reduce
      integer, dimension(2), intent(in) :: r1
      integer :: divisor
      divisor = gcd(r1(1), r1(2))
      reduce = r1/divisor
      if (reduce(2) < 1) then
         reduce(2) = abs(reduce(2))
         reduce(1) = -reduce(1)
      end if
   end function

   integer function gcd(i1, i2)
      integer, intent(in) :: i1, i2
      integer :: i1a, i2a, i
      i1a = abs(i1)
      i2a = abs(i2)
      gcd = 1
      if (i1a == 0 .or. i2a == 0) then
         gcd = max(i1a, i2a)
         return
      end if
      do i = 1, min(i1a, i2a)
         if (mod(i1a, i) == 0 .and. mod(i2a, i) == 0) then
            gcd = i
         end if
      end do
   end function

end module
