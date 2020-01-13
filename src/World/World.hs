module World.World
  (World(..)
  , testWorld
  ) where

import World.Scene.Scene (Scene, testScene)

data World = World
  { currentScene :: Scene
  } deriving (Show)

testWorld :: World
testWorld = World testScene
