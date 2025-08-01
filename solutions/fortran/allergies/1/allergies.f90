
module allergies
   implicit none

   character(*), parameter :: allergiesPossible(*) = ["eggs", "peanuts", "shellfish", "strawberries", &
                                                      "tomatoes", "chocolate", "pollen", "cats"]
contains
   integer function toKey(allergic_str)
      character(*), intent(in) :: allergic_str
      integer :: position(1)
      position = findloc(allergiesPossible, allergic_str)
      toKey = lshift(1, position(1) - 1)
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
      do i = 1, size(allergiesPossible)
         if (allergicTo(allergiesPossible(i), allergy_key)) then
            allergicList = trim(allergicList)//" "//allergiesPossible(i)
         end if
      end do
      allergicList = trim(adjustl(allergicList))
   end function

end module
