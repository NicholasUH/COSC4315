module Fibonacci (fibonacciIterativeIterative, fibonacciRecursiveRecursive, fibonacciRecursiveIterative) where

fibonacciIterativeIterative :: Int -> [Int]
fibonacciIterativeIterative number = map fst $ scanl fibStep (1, 1) [1..number]
  where
    fibStep (curr, next) _ = (next, curr + next)

fibonacciRecursiveRecursive :: Int -> [Int]
fibonacciRecursiveRecursive 0 = [1]
fibonacciRecursiveRecursive 1 = [1, 1]
fibonacciRecursiveRecursive n = 
    let fibSequence = fibonacciRecursiveRecursive (n - 1)
    in fibSequence ++ [sum (drop (length fibSequence - 2) fibSequence)]

fibonacciRecursiveIterative :: Int -> [Int]
fibonacciRecursiveIterative n = fibHelper n [1, 1]
  where
    fibHelper 0 _ = [1]
    fibHelper 1 series = series
    fibHelper number series = fibHelper (number - 1) (series ++ [sum (drop (length series - 2) series)])
