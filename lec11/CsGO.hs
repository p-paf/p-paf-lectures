-- | CsGo.hs You don't play?!
module CsGO where

import Data.List (sortBy)

data Team = Red | Blue deriving (Eq, Show, Read)

score :: [(String, Team, Double, Double)]
score = [("Snow Goons", Red, 21, 34), ("Gazorpozorp", Blue, 20, 25), ("Susie", Blue, 19, 0), ("Spaceman Spiff", Red, 13, 8), ("Transmogrifier", Red, 8, 0), ("Winslow", Blue, -1, 0), ("Stupendous Man", Blue, 13, 13), ("Rosalyn", Blue, 21, 3)]

-- using data types
data Player = Player {name :: String, team :: Team, kill :: Double, death :: Double} deriving (Show)

convert :: (String, Team, Double, Double) -> Player
convert (a, b, c, d) = Player a b c d

scoreboard = map convert score

redTeamKills = [p | p <- scoreboard, team p == Blue]
nicks = [name p | p <- scoreboard]
kdr = [(name p, kill p / death p) | p <- scoreboard, death p /= 0]
relativeplayers = [(name p, kill p, name q, kill q) | p <- scoreboard, q <- scoreboard]
relativeplayers' = [(name p, kill p, name q, kill q) | p <- scoreboard, q <- scoreboard, name p /= name q]
relativeplayers''' = [(name p, kill p, name q, kill q) | p <- scoreboard, q <- scoreboard, name p > name q, name p /= name q]
relativeplayers'''' = [(name p, kill p, name q, kill q) | p <- scoreboard, q <- scoreboard, name p > name q, name p /= name q, abs (kill p - kill q) < 7]

arranging f = sortBy (\p q -> compare (f p) (f q)) scoreboard

killsByBlueTeam :: [Player] -> Double -> Double
killsByBlueTeam [] acc = acc
killsByBlueTeam (p:ps) acc = killsByBlueTeam ps (kill p + acc)

deathByBlueTeam :: [Player] -> Double -> Double
deathByBlueTeam [] acc = acc
deathByBlueTeam (p:ps) acc = killsByBlueTeam ps (death p + acc)

generalBlueTeam :: (Player -> Double) -> Double -> [Player] -> Double
generalBlueTeam f acc [] = acc
generalBlueTeam f acc (p:ps) = generalBlueTeam f (f p + acc) ps

killsByBlueIgnoreTeam :: [Player] -> Double -> Double
killsByBlueIgnoreTeam [] acc = acc
killsByBlueIgnoreTeam (p:ps) acc = if kill p > 0 then killsByBlueIgnoreTeam ps (kill p + acc) else killsByBlueIgnoreTeam ps acc
