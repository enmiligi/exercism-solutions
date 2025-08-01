proc isLeapYear*(year: int): bool =
    if year mod 4 == 0:
        if year mod 100 == 0 and not (year mod 400 == 0):
            result = false
            return
        result = true
        return
    else:
        result = false
