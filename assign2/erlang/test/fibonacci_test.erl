-module(fibonacci_test).
-include_lib("eunit/include/eunit.hrl").

canary_test() ->
    ?assert(true).

fibonacci_test() ->
    TestCases = [
        {0, [1]},
        {1, [1, 1]},
        {2, [1, 1, 2]},
        {3, [1, 1, 2, 3]},
        {5, [1, 1, 2, 3, 5, 8]},
        {8, [1, 1, 2, 3, 5, 8, 13, 21, 34]},
        {10, [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]}
    ],

    lists:foreach(
        fun({N, ExpectedResult}) ->
            ?assertEqual(ExpectedResult, fibonacci:fibonacci_iterative_iterative(N)),
            ?assertEqual(ExpectedResult, fibonacci:fibonacci_recursive_recursive(N)),
            ?assertEqual(ExpectedResult, fibonacci:fibonacci_recursive_iterative(N))
        end,
        TestCases
    ).
