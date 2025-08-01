proc abbreviate {phrase} {
    set abbr ""
    foreach word [split $phrase " -_"] {
        append abbr [string index $word 0]
    }
    return [string toupper $abbr]
}
