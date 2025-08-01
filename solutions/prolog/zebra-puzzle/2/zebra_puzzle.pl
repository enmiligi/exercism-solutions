color(red).
color(green).
color(yellow).
color(ivory).
color(blue).

country(englishman).
country(spaniard).
country(ukrainian).
country(norwegian).
country(japanese).

pet(dog).
pet(snails).
pet(fox).
pet(horse).
pet(zebra).

beverage(coffee).
beverage(tea).
beverage(milk).
beverage(orange_juice).
beverage(water).

cigarette(old_gold).
cigarette(kool).
cigarette(chesterfield).
cigarette(lucky_strike).
cigarette(parliament).

house([Color, Country, Pet, Beverage, Cigarette]) :-
    color(Color),
    country(Country),
    pet(Pet),
    beverage(Beverage),
    cigarette(Cigarette).

right_of(H1, H2, [H1, H2 | _]).
right_of(H1, H2, [_ | Rest]) :-
    right_of(H1, H2, Rest).

next_to(H1, H2, Houses) :-
    right_of(H1, H2, Houses).
next_to(H1, H2, Houses) :-
    right_of(H2, H1, Houses).

different([X | Xs], [Y | Ys]) :-
    X \= Y,
    different(Xs, Ys).
different([], []).

all_different(Houses) :-
    foreach(select(House1, Houses, Rest), foreach(member(House2, Rest), different(House1, House2))).

solution(Houses) :-
    length(Houses, 5), % Statement 1
    member([red, englishman | _], Houses), % 2
    member([_, spaniard, dog | _], Houses), % 3
    member([green, _, _, coffee | _], Houses), % 4
    member([_, ukrainian, _, tea | _], Houses), % 5
    right_of([ivory | _], [green | _], Houses), % 6
    member([_, _, snails, _, old_gold], Houses), % 7
    member([yellow, _, _, _, kool], Houses), % 8
    [_, _, [_, _, _, milk, _], _, _] = Houses, % 9
    [[_, norwegian, _, _, _] | _] = Houses, % 10
    next_to([_, _, _, _, chesterfield], [_, _, fox | _], Houses), % 11
    next_to([_, _, _, _, kool], [_, _, horse | _], Houses), % 12
    member([_, _, _, orange_juice, lucky_strike ], Houses), % 13
    member([_, japanese, _, _, parliament], Houses), % 14
    next_to([_, norwegian | _], [blue | _], Houses), % 15 */
    maplist(house, Houses),
    all_different(Houses).

zebra_owner(Owner) :-
    solution(Houses),
    member([_, Owner, zebra, _, _], Houses).


water_drinker(Drinker) :-
    solution(Houses),
    member([_, Drinker, _, water, _], Houses).
