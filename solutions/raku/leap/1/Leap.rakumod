unit module Leap;

sub is-leap-year ($year) is export {
    $year %% 4 and not $year %% 100 or $year %% 400
}
