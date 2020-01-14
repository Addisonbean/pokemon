module World.World
  (World(..)
  , testWorld
  ) where

import Control.Lens (makeLenses)

import World.Scene.Scene (Scene, testScene)

data World = World
  { _currentScene :: Scene
  } deriving (Show)
makeLenses ''World

testWorld :: World
testWorld = World testScene
