
module high_scores
   implicit none
contains

   function scores(score_list)
      integer, dimension(:) :: score_list
      integer, dimension(size(score_list)) :: scores
      scores = score_list
   end function

   function latest(score_list)
      integer :: score_list(:)
      integer :: latest
      latest = score_list(size(score_list))
   end function latest

   function personalBest(score_list)
      integer :: score_list(:)
      integer :: personalBest
      personalBest = maxval(score_list)
   end function personalBest

   function personalTopThree(score_list)
      integer :: score_list(:)
      integer :: personalTopThree(3)
      integer :: top, second, third, i
      top = 0
      second = 0
      third = 0
      do i = 1, size(score_list)
         if (score_list(i) > top) then
            third = second
            second = top
            top = score_list(i)
         else if (score_list(i) > second) then
            third = second
            second = score_list(i)
         else if (score_list(i) > third) then
            third = score_list(i)
         end if
      end do
      personalTopThree = [top, second, third]
   end function personalTopThree

end module
