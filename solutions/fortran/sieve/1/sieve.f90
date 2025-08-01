module sieve
   implicit none

contains

   function primes(limit) result(array)
      integer, intent(in) :: limit
      integer, allocatable :: array(:)

      logical, allocatable :: isPrime(:)
      integer :: i, j, numPrimes

      allocate(isPrime(limit))
      isPrime(:) = .true.

      numPrimes = 0
      do i = 2, limit
         if (isPrime(i)) then
            do j = i*i, limit, i
               isPrime(j) = .false.
            end do
            numPrimes = numPrimes + 1
         end if
      end do

      allocate(array(numPrimes))

      i = 1
      do j = 2, limit
         if (isPrime(j))  then
            array(i) = j
            i = i + 1
         end if
      end do




   end function primes

end module sieve
