-module(fibonacci).
-export([fibonacci_iterative_iterative/1, fibonacci_recursive_recursive/1, fibonacci_recursive_iterative/1]).

fibonacci_iterative_iterative(Number) when Number >= 0 ->
    case Number of
        0 -> [1];
        1 -> [1, 1];
        _ ->
            {Series, _, _} = lists:foldl(
                fun(_, {AccList, Prev, Curr}) ->
                    {AccList ++ [Prev + Curr], Curr, Prev + Curr}
                end,
                {[1, 1], 1, 1},
                lists:seq(2, Number)
            ),
            Series
    end.

fibonacci_recursive_recursive(0) -> [1];
fibonacci_recursive_recursive(1) -> [1, 1];
fibonacci_recursive_recursive(N) when N > 1 ->
    Series = fibonacci_recursive_recursive(N - 1),
    Series ++ [lists:last(Series) + lists:nth(N - 1, Series)].

fibonacci_recursive_iterative(N) when N >= 0 ->
    fibonacci_helper(N, [1, 1]).

fibonacci_helper(0, _) -> [1];
fibonacci_helper(1, Series) -> Series;
fibonacci_helper(N, Series) ->
    fibonacci_helper(N - 1, Series ++ [lists:nth(length(Series) - 1, Series) + lists:nth(length(Series), Series)]).
