import algorithm, sequtils

type
  Student* = object
    name*: string
    grade*: int

  School* = object
    students*: seq[Student]

proc sort_students(students: seq[Student]): seq[string] =
  students.sortedByIt(it.name).sortedByIt(it.grade).mapIt(it.name)

proc roster*(school: School): seq[string] =
  ## Returns the names of every student in the `school`, sorted by grade then name.
  return school.students.sort_students

proc addStudent*(school: var School, name: string, grade: int) =
  ## Adds a student with `name` and `grade` to the `school`.
  ##
  ## Raises a `ValueError` if `school` already contains a student named `name`.
  if school.students.filterIt(it.name == name) != []:
    raise ValueError.new()
  school.students.add(Student(name: name, grade: grade))

proc grade*(school: School, grade: int): seq[string] =
  ## Returns the names of the students in the given `school` and `grade`, in
  ## alphabetical order.
  school.students.filterIt(it.grade == grade).sort_students
