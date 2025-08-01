{
    split($0, chars, //)
    for (i=length(chars); i >= 1; i--)
        printf chars[i]
}