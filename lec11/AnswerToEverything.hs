-- | AnswerToEverything.hs get it here
module AnswerToEverything where

get :: [(Int, Int)] -> [(Int, Int)]
get = filter ((42 ==) . fst)

get' :: [(Int, Int)] -> [(Int, Int)]
get' = filter (\x -> fst x == 42)

get'' :: [(Int, Int)] -> [(Int, Int)]
get'' [] = []
get'' (x:xs) = filter check xs
    where check x = fst x == 42

get''' :: [(Int, Int)] -> [(Int, Int)]
get''' [] = []
get''' (x:xs) = if check x then x : get''' xs else get''' xs
    where check x = fst x == 42

lotOfBliss :: [(Int, Int)] -> [Int]
lotOfBliss = map (uncurry (\x y -> x)) . get

answers :: [(Int, Int)]
answers = [ (42, 43), (96, 96), (42, 96), (1, 10), (5, 42), (76, 81), (42, -20) ]
