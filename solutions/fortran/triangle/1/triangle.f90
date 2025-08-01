
module triangle
   implicit none

   interface equilateral
      module procedure equilateral_real
      module procedure equilateral_int
   end interface

   interface scalene
      module procedure scalene_real
      module procedure scalene_int
   end interface

   interface isosceles
      module procedure isosceles_real
      module procedure isosceles_int
   end interface

contains
   logical function is_triangle(edges)
      real :: edges(3)
      integer :: i
      is_triangle = all([((sum(edges) - edges(i)) >= edges(i), i=1, 3)])
      is_triangle = is_triangle .and. edges(1) /= 0
   end function

   logical function equilateral_real(edges)
      real, dimension(3) :: edges
      equilateral_real = all(edges == edges(1)) .and. is_triangle(edges)
   end function

   logical function equilateral_int(edges)
      integer, dimension(3) :: edges
      equilateral_int = equilateral(real(edges))
   end function

   logical function isosceles_real(edges)
      real, dimension(3) :: edges
      isosceles_real = edges(1) == edges(2) .or. edges(2) == edges(3) .or. edges(1) == edges(3)
      isosceles_real = isosceles_real .and. is_triangle(edges)
   end function

   logical function isosceles_int(edges)
      integer, dimension(3) :: edges
      isosceles_int = isosceles(real(edges))
   end function

   logical function scalene_real(edges)
      real, dimension(3) :: edges
      scalene_real = (.not. isosceles(edges)) .and. is_triangle(edges)
   end function

   logical function scalene_int(edges)
      integer, dimension(3) :: edges
      scalene_int = scalene(real(edges))
   end function

end module
