module sieve
   implicit none

contains

   function primes(limit) result(array)
      integer, intent(in) :: limit
      integer, allocatable :: array(:)

      logical :: isPrime(limit)
      integer :: i, j

      isPrime(:) = .true.

      do i = 2, int(sqrt(real(limit)))
         if (isPrime(i)) then
            isPrime([(j, j = i*i, limit, i)]) = .false.
         end if
      end do

      array = pack([(i, i = 2, limit)], isPrime(2:))
   end function primes

end module sieve
