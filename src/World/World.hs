module World.World
  ( World(..)
  , loadWorld
  , look
  ) where

import Control.Lens (makeLenses, view)
import Data.Maybe (fromJust)

import World.Scene.Scene (Scene, description)
import World.Map (PokeMap(..), readScenesJson, mapFromScenes, scenes)
-- import GameState (GameState)
import qualified Data.HashMap.Strict as HM

data World = World
  { _map :: PokeMap
  , _currentSceneId :: String
  } deriving (Show)
makeLenses ''World

loadWorld :: FilePath -> IO (Maybe World)
loadWorld = fmap (fmap (flip World "start" . mapFromScenes)) . readScenesJson

currentScene :: World -> Scene
currentScene w = fromJust $ HM.lookup (_currentSceneId w) (view scenes $ _map w)

look :: World -> String
look = view description . currentScene
