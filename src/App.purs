module App where

import Prelude

import Data.Const (Const)
import Effect.Aff (Aff)
import Halogen as H
import Halogen.HTML as HH
import Tabs as Tabs
import Types (V(..))

type Query = Const Void

data Action = OnSelect V

type State =
  { value :: String
  }

type HTML = H.ComponentHTML Action () Aff


initialState :: State
initialState =
  { value: ""
  }

tabs :: Array (Tabs.Tab V)
tabs =
  [ { value: X
    , text: "X"
    }
  , { value: Y
    , text: "Y"
    }
  ]

render :: State -> HTML
render state =
  HH.div_
  [ Tabs.render
    { selected: X
    , onSelect: OnSelect
    } tabs
  ]

component :: H.Component HH.HTML Query Unit Void Aff
component = H.mkComponent
  { initialState: const initialState
  , render
  , eval: H.mkEval H.defaultEval
  }
