
module yacht
   implicit none

   ! | Ones | 1 × number of ones | Any combination        | 1 1 1 4 5 scores 3 |
   ! | Twos | 2 × number of twos | Any combination | 2 2 3 4 5 scores 4 |
   ! | Threes | 3 × number of threes | Any combination | 3 3 3 3 3 scores 15 |
   ! | Fours | 4 × number of fours | Any combination | 1 2 3 3 5 scores 0 |
   ! | Fives | 5 × number of fives| Any combination | 5 1 5 2 5 scores 15 |
   ! | Sixes | 6 × number of sixes | Any combination | 2 3 4 5 6 scores 6 |
   ! | Full House | Total of the dice | Three of one number and two of another | 3 3 3 5 5 scores 19 |
   ! | Four of a Kind | Total of the four dice | At least four dice showing the same face | 4 4 4 4 6 scores 16 |
   ! | Little Straight |  30 points | 1-2-3-4-5 | 1 2 3 4 5 scores 30 |
   ! | Big Straight | 30 points | 2-3-4-5-6 | 2 3 4 5 6 scores 30 |
   ! | Choice | Sum of the dice | Any combination | 2 3 3 4 6 scores 18 |
   ! | Yacht | 50 points | All five dice showing the same face | 4 4 4 4 4 scores 50 |

contains

   integer function score(dice, yacht_type)
      integer, dimension(5), intent(in) :: dice
      character(len=*), intent(in) :: yacht_type
      integer :: i, j
      score = 0
      select case (yacht_type)
      case ("ones")
         score = scoreNumber(dice, 1)
      case ("twos")
         score = scoreNumber(dice, 2)
      case ("threes")
         score = scoreNumber(dice, 3)
      case ("fours")
         score = scoreNumber(dice, 4)
      case ("fives")
         score = scoreNumber(dice, 5)
      case ("sixes")
         score = scoreNumber(dice, 6)
      case ("yacht")
         if (all(dice == dice(1))) then
            score = 50
         end if
      case ("full house")
         do i = 1, 6
            if (count(dice == i) == 3) then
               do j = 1, 6
                  if ((j /= i .and. count(dice == j) == 2) &
                      .or. count(dice == j) == 5) then
                     score = 2*j + 3*i
                     return
                  end if
               end do
            end if
         end do
      case ("four of a kind")
         do i = 1, 6
            if (count(dice == i) >= 4) then
               score = i*4
               exit
            end if
         end do
      case ("little straight")
         score = 30
         do i = 1, 5
            if (.not. any(dice == i)) then
               score = 0
            end if
         end do
      case ("big straight")
         score = 30
         do i = 2, 6
            if (.not. any(dice == i)) then
               score = 0
            end if
         end do
      case ("choice")
         score = sum(dice)
      end select
   end function

   integer function scoreNumber(dice, number)
      integer, dimension(5), intent(in) :: dice
      integer, intent(in) :: number
      scoreNumber = 0
      scoreNumber = count(dice == number)*number
   end function

end module
