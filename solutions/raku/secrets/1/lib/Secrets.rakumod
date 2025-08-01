unit module Secrets;

sub secret-add ($secret --> Code) is export {
    return * + $secret;
}

sub secret-subtract ($secret --> Code) is export {
    return -> $x {$x - $secret};
}

sub secret-multiply ($secret --> Code) is export {
    return {$^x * $secret};
}

sub secret-divide ($secret --> Code) is export {
    return {$_ / $secret};
}

sub secret-combine ($func1, $func2 --> Code) is export {
    return -> $x {$func2($func1($x))};
}
