getPersonDetails :: (String, Int, Double)
getPersonDetails = ("Alice", 30, 5.6)

main :: IO ()
main = do
  let (name, age, height) = getPersonDetails
  putStrLn $ "Name: " ++ name
  putStrLn $ "Age: " ++ show age
  putStrLn $ "Height: " ++ show height
