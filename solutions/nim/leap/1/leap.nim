proc isLeapYear*(year: int): bool =
    if year mod 400 == 0:
        result = true
    elif year mod 100 == 0:
        result = false
    elif year mod 4 == 0:
        result = true
    else:
        result = false
