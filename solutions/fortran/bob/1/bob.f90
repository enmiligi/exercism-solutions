module bob
   implicit none
   character(*), parameter :: lowercaseLetters = "abcdefghijklmnopqrstuvwxyz"
   character(*), parameter :: uppercaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
   character(*), parameter :: letters = lowercaseLetters//uppercaseLetters
contains
   pure function hey(statement)
      character(:), allocatable :: hey
      character(*), intent(in) :: statement
      character(:), allocatable :: trimmedStatement
      logical :: isYelled, isQuestion, isEmpty, hasLetters

      trimmedStatement = trim(adjustl(statement))
      isEmpty = trimmedStatement == ""
      hasLetters = scan(trimmedStatement, letters) > 0
      isYelled = scan(trimmedStatement, lowercaseLetters) == 0 .and. hasLetters
      isQuestion = trimmedStatement(len(trimmedStatement):len(trimmedStatement)) == '?'

      if (isEmpty) then
         hey = "Fine. Be that way!"
      else if (isYelled .and. isQuestion) then
         hey = "Calm down, I know what I'm doing!"
      else if (isYelled) then
         hey = "Whoa, chill out!"
      else if (isQuestion) then
         hey = "Sure."
      else
         hey = "Whatever."
      end if
   end function hey
end module bob
