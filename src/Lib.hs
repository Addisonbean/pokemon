module Lib
  ( runGame
  ) where

import Game (loadGame, perfromGame)

runGame :: IO ()
runGame = do
  Just game <- loadGame "world_data/scenes.json"
  perfromGame game
