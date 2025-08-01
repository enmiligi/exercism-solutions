{ name = $0}
END { 
    if (name == "") {
        name = "you"
    }
    print "One for " name ", one for me."
}
