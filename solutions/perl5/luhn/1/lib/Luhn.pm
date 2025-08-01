package Luhn;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_luhn_valid>;

sub is_luhn_valid ($number) {
    (my $code = $number) =~ s/\s//g;
    return 0 if ($code =~ m/\D/);
    return 0 if (length($code) < 2);
    my $sum = 0;
    foreach my $i (1..length($code)) {
        if ($i % 2 == 0) {
            my $doubled = substr($code, length($code) - $i, 1)*2;
            $doubled -= 9 if ($doubled > 9);
            $sum += $doubled;
        } else {
            $sum += substr($code, length($code) - $i, 1);
        }
    }
    return ($sum % 10) == 0;
}
