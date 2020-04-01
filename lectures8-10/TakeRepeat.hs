module TakeRepeat where

import Data.Maybe

myRepeat :: a -> [a]
myRepeat x = x : myRepeat x

myTake :: Int -> [a] -> [a]
myTake n _      | n <= 0 =  []              -- base case
myTake _ []              =  []              -- base 
myTake n (x:xs)          =  x : myTake (n-1) xs

