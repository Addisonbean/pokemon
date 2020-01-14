module Pokemon.PokeTeam
  ( PokeTeam(..)
  , testTeam
  ) where

import Pokemon.Pokemon (Pokemon(..), testPokemon)

data PokeTeam = PokeTeam [Pokemon] deriving (Show)

testTeam :: PokeTeam
testTeam = PokeTeam [testPokemon]
