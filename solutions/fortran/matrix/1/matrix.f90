
module matrix
   implicit none

contains
   function toMatrix(matrix, dims) result(m)
      integer, intent(in) :: dims(2)
      character(*), intent(in) :: matrix(dims(1))
      integer :: m(dims(1), dims(2))
      integer :: i
      do i = 1, dims(1)
         read (matrix(i), *) m(i, :)
      end do
   end function

   function row(matrix, dims, i) result(r)
      integer, dimension(2), intent(in) :: dims
    !! Matrix dimensions (nrows, ncols)
      character(len=*), dimension(dims(1)), intent(in) :: matrix
    !! Matrix as a 1-d array of strings
      integer, intent(in) :: i
    !! Row index
      integer, dimension(dims(2)) :: r
      integer :: m(dims(1), dims(2))
      m = toMatrix(matrix, dims)
      r = m(i, :)
   end function

   function column(matrix, dims, j) result(c)
      integer, dimension(2), intent(in) :: dims
    !! Matrix dimensions (nrows, ncols)
      character(len=*), dimension(dims(1)), intent(in) :: matrix
    !! Matrix as a 1-d array of strings
      integer, intent(in) :: j
    !! Column index
      integer, dimension(dims(1)) :: c
      integer :: m(dims(1), dims(2))
      m = toMatrix(matrix, dims)
      c = m(:, j)
   end function

end module
