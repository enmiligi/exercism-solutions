sub series ($string, $length) is export {
    if $length > $string.chars() {
        die "Slice length is too large";
    } elsif $length <= 0 {
        die "Slice length must be more than zero";
    } else {
        my $regex = ".**$length";
        return map (*.Str), $string.match(/ <$regex> /, :overlap);
    }
}
