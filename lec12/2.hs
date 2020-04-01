main :: IO ()
main = do
    t <- fmap read getLine
    -- discuss type erasure here
    printList [1..t]

printList :: (Show a) => [a] -> IO ()
printList [] = putStr ""
printList (x:xs) = do
    case_str <- getLine
    let n = (read . head . words) (case_str)
    let k = (read . last . words) (case_str)
    putStrLn (solve n k)
    printList xs  

solve :: Integer -> Integer -> String
solve n k 
    | ((n >= (k * k)) && ((n `mod` 2) == (k `mod` 2))) = "YES"
    | otherwise = "NO"