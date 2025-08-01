-module(all_your_base).

-export([rebase/3, toBase/2, fromBase/2]).

fromBase(Digits, Base) ->
    lists:foldl(fun(Digit, Acc) -> Acc * Base + Digit end, 0, Digits).

toBase(0, _, []) ->
    [0];
toBase(0, _, Acc) ->
    Acc;
toBase(Value, Base, Acc) ->
    toBase(Value div Base, Base, [Value rem Base | Acc]).

toBase(Digits, Base) ->
    toBase(Digits, Base, []).

rebase(_, InputBase, _) when InputBase < 2 ->
    {error, "input base must be >= 2"};
rebase(_, _, OutputBase) when OutputBase < 2 ->
    {error, "output base must be >= 2"};
rebase(Digits, InputBase, OutputBase) ->
    ValidDigits = lists:all(fun(Digit) -> Digit < InputBase andalso Digit >= 0 end, Digits),
    if ValidDigits ->
           {ok, toBase(fromBase(Digits, InputBase), OutputBase)};
       true ->
           {error, "all digits must satisfy 0 <= d < input base"}
    end.
