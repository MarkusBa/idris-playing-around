module Main

prod : List Integer -> Integer
prod = foldl (*) 1

fac : Integer -> Integer
fac n = prod [1..n]

alert : String -> IO ()
alert s = mkForeign (FFun "alert" [FString] FUnit) s

main : IO ()
main = alert $ show (fac 300)
