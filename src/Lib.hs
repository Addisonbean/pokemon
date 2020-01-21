module Lib
  ( runGame
  ) where

import Control.Monad.State (liftIO)
import System.IO (hFlush, stdout)

import Control.Monad.Trans.Random (evalRandT)
import Control.Monad.Trans.State (evalStateT)
import System.Random (getStdGen)

import GameState (GameState, parseCommand, execCommand)
import Game (loadGame)

prompt :: String -> IO String
prompt s = putStr s >> hFlush stdout >> getLine

eventLoop :: GameState ()
eventLoop = do
  line <- liftIO (prompt "> ")
  maybe (liftIO $ putStrLn "invalid input") execCommand $ parseCommand line
  eventLoop

runGame :: IO ()
runGame = do
  gen <- getStdGen
  Just game <- loadGame "world_data/scenes.json"
  evalRandT (evalStateT eventLoop game) gen
  return ()
