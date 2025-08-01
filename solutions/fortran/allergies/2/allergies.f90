
module allergies
   implicit none
contains
   integer function toKey(allergic_str)
      character(*), intent(in) :: allergic_str
      integer :: position
      select case (allergic_str)
      case ("eggs")
         position = 1
      case ("peanuts")
         position = 2
      case ("shellfish")
         position = 3
      case ("strawberries")
         position = 4
      case ("tomatoes")
         position = 5
      case ("chocolate")
         position = 6
      case ("pollen")
         position = 7
      case ("cats")
         position = 8
      end select
      toKey = 2**(position - 1)
   end function

   function toStr(allergic_key)
      integer, intent(in) :: allergic_key
      character(:), allocatable :: toStr
      select case (allergic_key)
      case (1)
         toStr = "eggs"
      case (2)
         toStr = "peanuts"
      case (3)
         toStr = "shellfish"
      case (4)
         toStr = "strawberries"
      case (5)
         toStr = "tomatoes"
      case (6)
         toStr = "chocolate"
      case (7)
         toStr = "pollen"
      case (8)
         toStr = "cats"
      end select
   end function

   logical function allergicTo(allergy_str, allergy_key)
      character(len=*), intent(in) :: allergy_str
      integer, intent(in) :: allergy_key
      allergicTo = iand(toKey(allergy_str), allergy_key) /= 0
   end function

   function allergicList(allergy_key)
      integer, intent(in) :: allergy_key
      character(len=100) :: allergicList
      integer :: i
      allergicList = ""
      do i = 1, 8
         if (allergicTo(toStr(i), allergy_key)) then
            allergicList = trim(allergicList)//" "//toStr(i)
         end if
      end do
      allergicList = trim(adjustl(allergicList))
   end function

end module
