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

import Game (Game)

type GameState = StateT Game (RandT StdGen IO)

data Command
  = NoCommand
  deriving (Show)

-- TODO: use a proper parser
-- TODO: return `Either String Command` ?
parseCommand :: String -> Maybe Command
parseCommand = parseCommand' . words
  where
    parseCommand' [] = Just NoCommand
    parseCommand' _ = Nothing

execCommand :: Command -> GameState ()
execCommand NoCommand = return ()
