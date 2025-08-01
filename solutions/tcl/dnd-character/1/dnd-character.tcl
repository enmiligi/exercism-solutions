namespace eval dnd {
    namespace export character ability modifier
    namespace ensemble create

    proc modifier {score} {
        return [expr {int(floor(($score-10)/2))}]
    }

    proc ability {} {
        set min 6
        set sum 0
        for {set i 0} {$i < 4} {incr i} {
            set rand [expr {int(rand() * 6 + 1)}]
            incr sum $rand
            set min [expr {min($min, $sum)}]
        }
        return [expr {$sum - $min}]
    }

    proc character {} {
        set constitution [ability]
        dict create \
            strength [ability] \
            dexterity [ability] \
            constitution $constitution \
            intelligence [ability] \
            wisdom [ability] \
            charisma [ability] \
            hitpoints [expr {10 + [modifier $constitution]}]
    }
}
