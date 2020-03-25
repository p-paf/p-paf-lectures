-- | Lec7.hs

type Pos = (Int, Int)

-- | move a vector by a given offset
move :: Pos -> Pos -> Pos
move start offset = (fst start + fst offset, snd start + snd offset)
move' (x, y) (a, b) = (x + a, y + b)

type Point a = (a, a)

-- | remove fractional part of erroneous reading
smooth :: Point Double -> Point Int
smooth (x, y) = (floor x, floor y)


-- type Tree = (Int, [Tree])
data Tree = Leaf | Branch Int [Tree] deriving (Show)
data SatOnAWall = Humpty | Dumpty deriving (Show)

data Request a b = Response a | Error b deriving (Show)
