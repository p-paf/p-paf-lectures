-- | CsGo.hs You don't play?!
module CsGO where

data Team = Red | Blue deriving (Eq, Show, Read)

score :: [(String, Team, Int, Int)]
score = [("Snow Goons", Red, 21, 34), ("Gazorpozorp", Blue, 20, 25), ("Susie", Blue, 19, 0), ("Spaceman Spiff", Red, 13, 8), ("Transmogrifier", Red, 8, 0), ("Winslow", Blue, -1, 0), ("Stupendous Man", Blue, 13, 13), ("Rosalyn", Blue, 21, 3)]

-- using data types
data Player = Player {name :: String, team :: Team, kill :: Int, death :: Int} deriving (Show)

convert :: (String, Team, Int, Int) -> Player
convert (a, b, c, d) = Player a b c d

scoreboard = map convert score

redTeamKills = [p | p <- scoreboard, team p == Red]