module Pokemon.Pokemon
  ( Pokemon(..)
  , testPokemon
  ) where

import Pokemon.PokeType (PokeType(..))
import Pokemon.PokeStats (PokeStats(..))

data Pokemon = Pokemon
  { pokemonType :: PokeType
  , pokemonHp :: Int
  , pokemonStats :: PokeStats
  } deriving (Show)

testPokemon :: Pokemon
testPokemon = Pokemon
    { pokemonType = Electric
    , pokemonHp = 1
    , pokemonStats = PokeStats 1
    }
