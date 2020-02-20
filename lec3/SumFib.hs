-- | SumFib.hs
module SumFib where

-- | find the sum of all even fibonacci numbers
-- less than the given limit
-- problem found at https://projecteuler.net/problem=2
solution :: Int -> Int -> Int -> Int -> Int
solution ans prevfib fib limit =
    if (fib < limit) then
        if (fibeven fib) then
            solution (fib + ans) fib nextfib limit
        else
            solution ans fib nextfib limit
    else
        ans
    where
        nextfib = prevfib + fib

-- | returns true if number is even
fibeven :: Int -> Bool
fibeven num = num `mod` 2 == 0
