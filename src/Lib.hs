module Lib
    ( someFunc
    ) where

import GameState (testGameState)

someFunc :: IO ()
someFunc = putStrLn $ show testGameState
