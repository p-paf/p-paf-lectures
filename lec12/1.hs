main :: IO ()
main = do
    t_str <- getLine
    let t = read t_str :: Integer
    printList [1..t]
 
 
printList :: (Show a) => [a] -> IO ()
printList [] = putStr ""
printList (x:xs) = do
    case_str <- getLine
    let n = (read (head (words case_str)) :: Integer)
    let k = (read (last (words case_str)) :: Integer) 
    putStrLn (solve n k)
    printList xs  
 
solve :: Integer -> Integer -> String
solve n k 
    | ((n >= (k * k)) && ((n `mod` 2) == (k `mod` 2))) = "YES"
    | otherwise = "NO"