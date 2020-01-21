module World.World
  ( World(..)
  , loadWorld
  , look
  ) where

import Control.Lens (makeLenses, view)
import Data.Aeson (decodeFileStrict')
import Data.Maybe (fromJust)

import World.Scene.Scene (Scene, description, sceneId)
import Data.HashMap.Strict (HashMap)
import qualified Data.HashMap.Strict as HM

type Scenes = HashMap String Scene

data World = World
  { _scenes :: Scenes
  , _currentSceneId :: String
  } deriving (Show)
makeLenses ''World

scenesFromList :: [Scene] -> Scenes
scenesFromList = HM.fromList . map (\s -> (view sceneId s, s))

loadWorld :: FilePath -> IO (Maybe World)
loadWorld = fmap (fmap (flip World "start" . scenesFromList)) . decodeFileStrict'

currentScene :: World -> Scene
currentScene w = fromJust $ HM.lookup (_currentSceneId w) (_scenes w)

look :: World -> String
look = view description . currentScene
