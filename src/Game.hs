module Game
  ( Game(..)
  , testGame
  , pokemon
  ) where

import Control.Lens (over, makeLenses)

import Pokemon.Pokemon (Pokemon, testPokemon)
import World.World (World, testWorld)

data Game = Game
  { _pokemon :: Pokemon
  , _world :: World
  } deriving (Show)
makeLenses ''Game


testGame :: Game
testGame = Game testPokemon testWorld
