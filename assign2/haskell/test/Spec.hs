import Test.Hspec ( hspec, describe, it, shouldBe )
import Fibonacci (fibonacciIterativeIterative, fibonacciRecursiveRecursive, fibonacciRecursiveIterative)

main :: IO ()
main = hspec $ do
  let testCases = 
          [ (0, [1])
          , (1, [1, 1])
          , (2, [1, 1, 2])
          , (3, [1, 1, 2, 3])
          , (5, [1, 1, 2, 3, 5, 8])
          , (8, [1, 1, 2, 3, 5, 8, 13, 21, 34])
          , (10, [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89])
          ]
  describe "Canary test" $ do
    it "should pass this test" $ do
      True `shouldBe` True

  describe "Iterative Fibonacci Test" $ do
    mapM_ (\(input, expected) -> 
      it ("returns " ++ show expected ++ " when n is " ++ show input) $ do
        fibonacciIterativeIterative input `shouldBe` expected
      ) testCases

  describe "Recursive Fibonacci Test" $ do
    mapM_ (\(input, expected) -> 
      it ("returns " ++ show expected ++ " when n is " ++ show input) $ do
        fibonacciRecursiveRecursive input `shouldBe` expected
      ) testCases

  describe "Recursive Procedure, Iterative Process Fibonacci Test" $ do
    mapM_ (\(input, expected) -> 
      it ("returns " ++ show expected ++ " when n is " ++ show input) $ do
        fibonacciRecursiveIterative input `shouldBe` expected
      ) testCases
      
