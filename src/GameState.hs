module GameState
  ( GameState
  , parseCommand
  , execCommand
  ) where

import Control.Lens (over)
import Control.Monad.State (liftIO, state, modify)
import Control.Monad.Trans.State (StateT)
import Control.Monad.Trans.Random (RandT)
import System.Random (StdGen)

import Game (Game, pokemon)
import Pokemon.Pokemon (healPokemon)

type GameState = StateT Game (RandT StdGen IO)

data Command
  = Heal Int
  | NoCommand
  deriving (Show)

-- TODO: use a proper parser
-- TODO: return `Either String Command` ?
parseCommand :: String -> Maybe Command
parseCommand = parseCommand' . words
  where
    parseCommand' ["heal", n] = Just $ Heal (read n)
    parseCommand' [] = Just NoCommand
    parseCommand' _ = Nothing

execCommand :: Command -> GameState ()
execCommand (Heal n) = liftIO $ putStrLn "bouta' heal"
execCommand NoCommand = return ()

heal :: Int -> GameState ()
heal n = modify $ over pokemon (healPokemon n)
