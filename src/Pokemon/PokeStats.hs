module Pokemon.PokeStats
  ( PokeStats(..)
  ) where

import Control.Lens (makeLenses)

data PokeStats = PokeStats
  { _pokeStatHp :: Int
  } deriving (Show)
makeLenses ''PokeStats
