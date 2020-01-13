module GameState
  ( GameState(..)
  , testGameState
  ) where

import Pokemon.Pokemon (Pokemon, testPokemon)
import World.World (World, testWorld)

data GameState = GameState
  { pokemon :: Pokemon
  , world :: World
  -- , player :: Player
  } deriving (Show)

testGameState :: GameState
testGameState = GameState testPokemon testWorld
