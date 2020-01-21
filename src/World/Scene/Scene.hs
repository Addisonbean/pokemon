module World.Scene.Scene
  ( Scene(..)
  , sceneId
  , description
  ) where

import Control.Lens (makeLenses)
import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics (Generic)

data SceneExits = SceneExits
  { exitLeft :: Maybe String
  , exitRight :: Maybe String
  , exitTop :: Maybe String
  , exitButtom :: Maybe String
  } deriving (Show, Generic)
makeLenses ''SceneExits

instance ToJSON SceneExits
instance FromJSON SceneExits

data Scene = Scene
  { _sceneId :: String
  , _description :: String
  , _exits :: SceneExits
  } deriving (Show, Generic)
makeLenses ''Scene

instance ToJSON Scene
instance FromJSON Scene
