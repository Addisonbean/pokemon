module Game
  ( Game(..)
  , testGame
  ) where

import Pokemon.Pokemon (Pokemon, testPokemon)
import World.World (World, testWorld)

data Game = Game
  { pokemon :: Pokemon
  , world :: World
  -- , player :: Player
  } deriving (Show)

testGame :: Game
testGame = Game testPokemon testWorld
