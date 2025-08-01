# self.rows_matrix and self.columns_matrix from
# https://exercism.io/tracks/python/exercises/matrix/solutions/57b596765ca74497a3dffd79c144efd9


class Matrix:
    def __init__(self, matrix_string):
        self.matrix_string = matrix_string
        self.rows_matrix = [
            [int(n) for n in row.split()] for row in matrix_string.splitlines()
        ]
        self.columns_matrix = [[row[index] for row in self.rows_matrix]
                               for index in range(len(self.rows_matrix[0]))]

    def row(self, index):
        return self.rows_matrix[index - 1]

    def column(self, index):
        return self.columns_matrix[index - 1]
