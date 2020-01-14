module Pokemon.Pokemon
  ( Pokemon(..)
  , testPokemon
  , healPokemon
  ) where

import Control.Lens (over, makeLenses)

import Pokemon.PokeType (PokeType(..))
import Pokemon.PokeStats (PokeStats(..))

data Pokemon = Pokemon
  { _pokemonType :: PokeType
  , _pokemonHp :: Int
  , _pokemonStats :: PokeStats
  } deriving (Show)
makeLenses ''Pokemon

testPokemon :: Pokemon
testPokemon = Pokemon
    { _pokemonType = Electric
    , _pokemonHp = 1
    , _pokemonStats = PokeStats 1
    }

healPokemon :: Int -> Pokemon -> Pokemon
healPokemon n = over pokemonHp (+n)
