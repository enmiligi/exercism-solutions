import strformat
proc reverse*(text: string): string =
    for ch in text:
        result.insert(&"{ch}", 0)
