module Bliss where

import MyOp

-- takes two Ints and ignores the second, returns the first
-- Note how this is actually curried.
bliss :: Int -> Int -> Int
bliss x y = x

n1 = bliss 5 7
middleman = myOp 3 (29^35724353) 5                                 -- lot of computation
n2 = bliss 5 middleman

