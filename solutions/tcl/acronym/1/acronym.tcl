proc abbreviate {phrase} {
    if {[string is alpha [string index $phrase 0]]} {
        set abbr [string toupper [string index $phrase 0]]
    } else {
        set abbr ""
    }
    for {set i 0} {$i < ([string length $phrase] - 1)} {incr i} {
        if {[regexp {_|-| } [string index $phrase $i]] &&
            ![regexp {_|-| } [string index $phrase [expr {$i + 1}]]]} {
            append abbr [string toupper [string index $phrase [expr {$i + 1}]]]
        }
    }
    return $abbr
}
