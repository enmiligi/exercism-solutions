
module space_age
   implicit none
contains

   double precision function age_in_years(planet, seconds)
      character(len=*), intent(in) :: planet
      double precision, intent(in) :: seconds
      double precision :: earth_years
      earth_years = seconds/31557600.d0
      select case (planet)
      case ("Mercury")
         age_in_years = earth_years/0.2408467d0
      case ("Venus")
         age_in_years = earth_years/0.61519726d0
      case ("Earth")
         age_in_years = earth_years
      case ("Mars")
         age_in_years = earth_years/1.8808158d0
      case ("Jupiter")
         age_in_years = earth_years/11.862615d0
      case ("Saturn")
         age_in_years = earth_years/29.447498d0
      case ("Uranus")
         age_in_years = earth_years/84.016846d0
      case ("Neptune")
         age_in_years = earth_years/164.79132d0
      end select
   end function

end module
