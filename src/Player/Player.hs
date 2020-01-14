module Player.Player
  ( Player(..)
  , testPlayer
  ) where

import Control.Lens (makeLenses)

import Pokemon.PokeTeam (PokeTeam(..), testTeam)

data Player = Player
  { _playerTeam :: PokeTeam
  , _name :: String
  } deriving (Show)
makeLenses ''Player

testPlayer :: Player
testPlayer = Player
  { _playerTeam = testTeam
  , _name = "joe"
  }
