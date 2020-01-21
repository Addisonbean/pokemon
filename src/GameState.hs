module GameState
  ( GameState
  , parseCommand
  , execCommand
  ) where

import Control.Lens (over, view)
import Control.Monad.State (liftIO, state, modify, get)
import Control.Monad.Trans.State (StateT)
import Control.Monad.Trans.Random (RandT)
import System.Random (StdGen)

import Game (Game, world)
import World.World (look)

type GameState = StateT Game (RandT StdGen IO)

data Command
  = NoCommand
  | Look
  deriving (Show)

-- TODO: use a proper parser
-- TODO: return `Either String Command` ?
parseCommand :: String -> Maybe Command
parseCommand = parseCommand' . words
  where
    parseCommand' [] = Just NoCommand
    parseCommand' ["look"] = Just Look
    parseCommand' _ = Nothing

execCommand :: Command -> GameState ()
execCommand NoCommand = return ()
execCommand Look = get >>= liftIO . putStrLn . look . view world
