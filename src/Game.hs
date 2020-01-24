module Game
  ( Game(..)
  , loadGame
  , perfromGame
  ) where

import Control.Lens (over, makeLenses)
import Control.Monad.Trans.Maybe (MaybeT(..), runMaybeT)
import System.IO (hFlush, stdout)

import Player.Player (Player, testPlayer)
import World.World (World, loadWorld)

loadGame :: FilePath -> IO (Maybe Game)
loadGame f = runMaybeT $ do
  w <- MaybeT $ loadWorld f
  return $ Game
    { _state = DoCommand
    , _world = w
    , _player = testPlayer
    }

data GameState = DoCommand | Custom (Game -> String -> GameResult) | Done

type GameResult = (Maybe String, Game)

actionForState :: GameState -> (Game -> String -> GameResult)
actionForState DoCommand = \g s ->
  case parseCommand s of
    Just cmd -> runCommand g cmd
    Nothing -> (Just "unknown command", g)
actionForState (Custom f) = f
actionForState Done = undefined

data Command
  = Help
  | Look
  | EmptyCommand

parseCommand :: String -> Maybe Command
parseCommand "" = Just EmptyCommand
parseCommand "help" = Just Help
parseCommand "h" = Just Help
parseCommand "look" = Just Look
parseCommand "l" = Just Look
parseCommand _ = Nothing

runCommand :: Game -> Command -> GameResult
runCommand g Help = (Just "no help for you", g)
runCommand g EmptyCommand = (Nothing, g)
runCommand g Look = undefined

data Game = Game
  { _state :: GameState
  , _player :: Player
  , _world :: World
  }
makeLenses ''Game

gameDone :: Game -> Bool
gameDone = gameDone' . _state
  where
    gameDone' Done = True
    gameDone' _ = False

prompt :: String -> IO String
prompt s = putStr s >> hFlush stdout >> getLine

perfromGame :: Game -> IO ()
perfromGame g =
  if gameDone g
     then return ()
     else do
       input <- prompt "> "
       let (output, g2) = (actionForState $ _state g) g input
       case output of
         Just o -> putStrLn o
         Nothing -> return ()
       perfromGame g2
