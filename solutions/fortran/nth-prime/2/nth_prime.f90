module nth_prime
   implicit none
contains
   logical function isPrime(n)
      integer, intent(in) :: n
      integer :: i
      isPrime = .true.
      do i = 3, int(1 + sqrt(real(n))), 2
         if (mod(n, i) == 0) then
            isPrime = .false.
            exit
         end if
      end do
   end function

   ! get nth prime
   integer function prime(n)
      integer, intent(in) :: n
      integer :: i, num_primes
      i = 3
      num_primes = 1
      if (n <= 0) then
         prime = -1
      else if (n == 1) then
         prime = 2
      else
         do
            if (isPrime(i)) then
               num_primes = num_primes + 1
               if (num_primes == n) then
                  prime = i
                  exit
               end if
            end if
            i = i + 2
         end do
      end if
   end function

end module
