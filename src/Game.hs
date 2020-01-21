module Game
  ( Game(..)
  , loadGame
  , world
  ) where

import Control.Lens (over, makeLenses)

import Player.Player (Player, testPlayer)
import World.World (World, loadWorld)

data Game = Game
  { _player :: Player
  , _world :: World
  } deriving (Show)
makeLenses ''Game

loadGame :: FilePath -> IO (Maybe Game)
loadGame = fmap (fmap (Game testPlayer)) . loadWorld
