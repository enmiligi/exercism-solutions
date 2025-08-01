unit module ValentinesDay;

enum Answer is export (Yes => True, No => False);

# You may use enums, subsets, classes, or roles as you see fit.
class  Chill       is export {}
enum   Restaurant  is export ('Korean','Turkish');
enum   Movie       is export ('Crime', 'Horror', 'Romance');
enum   Game        is export ('Chess', 'TicTacToe', 'GlobalThermonuclearWar');
subset Walk of Num is export where 0 < * < Inf;

subset Activity is export where * ~~ any(Chill,Restaurant, Movie, Game, Walk);

multi rate-activity ( Chill --> Answer ) is export {
    No
}

multi rate-activity ( Restaurant $cuisine --> Answer ) is export {
    if $cuisine == Turkish {Answer}
    else {Yes}
}

multi rate-activity (Movie $movie --> Answer) is export {
    if $movie == Romance {Yes} else {No}
}

multi rate-activity (Game $game --> Answer) is export {
    if $game == TicTacToe {Answer}
    elsif $game == Chess {Yes}
    else {No}
}

multi rate-activity (Walk $distance --> Answer) is export {
    if $distance < 3 {Yes}
    elsif $distance < 10 {Answer}
    else {No}
}
