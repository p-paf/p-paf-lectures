module BadAdd where


-- tail recursive
badLazyAddList :: Num a => [a] -> a
badLazyAddList = (go 0)
  where go acc []     = acc
        go acc (x:xs) = go (x + acc) xs

        

{-  
- here's how it evaluates:

go 0 [1,2,3,4]
go (1 + 0) [2,3,4]
go (2 + (1 + 0)) [3,4]
go (3 + (2 + (1 + 0))) [4]
go (4 + (3 + (2 + (1 + 0)))) []
(4 + (3 + (2 + (1 + 0))))
(4 + (3 + (2 + 1)))
(4 + (3 + 3))
(4 + 6)
10

- here's how we'd like it to be:

go 0 [1,2,3,4]
go (1 + 0) [2,3,4]
go (2 + 1) [3,4]
go (3 + 3) [4]
go (4 + 6) []
(4 + 6)
10

-}