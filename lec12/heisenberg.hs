main :: IO ()
main = do
    putStrLn "Say My Name"
    name <- getLine
    let name_str = read name :: String
    if name == "heisenberg"
        then putStrLn "You're god damn right."
        else main