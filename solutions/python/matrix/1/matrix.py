class Matrix:
    def __init__(self, matrix_string):
        self.matrix_string = matrix_string
        self.rows = matrix_string.splitlines()
        self.list_rows = list(
            map(lambda x: list(map(int, x.split(' '))), self.rows))
        self.columns = [[] for i in range(len(self.list_rows[0]))]
        for row in self.list_rows:
            item_num = 0
            for item in row:
                self.columns[item_num].append(item)
                item_num += 1

    def row(self, index):
        return self.list_rows[index - 1]

    def column(self, index):
        return self.columns[index - 1]


Matrix("1 2\n3 4")
