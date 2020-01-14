module Game
  ( Game(..)
  , testGame
  ) where

import Control.Lens (over, makeLenses)

import Player.Player (Player, testPlayer)
import World.World (World, testWorld)

data Game = Game
  { _player :: Player
  , _world :: World
  } deriving (Show)
makeLenses ''Game

testGame :: Game
testGame = Game testPlayer testWorld
