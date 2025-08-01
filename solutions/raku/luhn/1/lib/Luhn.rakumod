unit module Luhn;

sub is-luhn-valid ($input) is export {
    (my $code = $input) ~~ s:g/\s//;
    return False if ($code ~~ /\D/);
    return False if ($code.chars < 2);
    my @chars = $code.comb.map({$_.Int});
    loop (my $i = $code.chars - 2; $i >= 0; $i -= 2) {
        @chars[$i] = @chars[$i]*2;
        @chars[$i] = @chars[$i]-9 if (@chars[$i] > 9);
    }
    return sum(@chars) % 10 == 0
}
