module Map where

addThree :: Int -> Int
addThree x = x + 3

myMap :: (a -> b) -> [a] -> [b]
myMap _ [] = []
myMap f (x:xs) = f x : myMap f xs

l1 = myMap addThree [2, 4, 5]
l2 = myMap (\z->z+3) [2, 4, 5]
l3 = myMap (+3) [2, 4, 5]
