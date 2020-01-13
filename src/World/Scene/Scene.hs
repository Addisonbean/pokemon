module World.Scene.Scene
  (Scene(..)
  , testScene
  ) where

data Scene = Scene
  { description :: String
  } deriving (Show)

testScene :: Scene
testScene = Scene "hey there"
