main :: IO ()
main = do
    t <- fmap read getLine
    printList [1..t]

printList :: (Show a) => [a] -> IO ()
printList [] = putStr ""
printList (x:xs) = do
    n:k:[] <- fmap ((fmap read) . words) getLine                      -- this is the climax of this lecture
    putStrLn (solve n k)
    printList xs  

solve :: Integer -> Integer -> String
solve n k 
    | ((n >= (k * k)) && ((n `mod` 2) == (k `mod` 2))) = "YES"
    | otherwise = "NO"