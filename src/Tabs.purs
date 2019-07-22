module Tabs
  ( Tab
  , render
  ) where

import Prelude

import Data.Maybe (Maybe(..))
import Halogen.HTML as HH
import Halogen.HTML.Events as HE

type Props t f =
  { selected :: t
  , onSelect :: t -> f
  }

type Tab t =
  { value :: t
  , text :: String
  }

renderTab :: forall t p f. Eq t => Props t f -> Tab t -> HH.HTML p f
renderTab { selected, onSelect } tab =
  HH.li
  [ HE.onClick $ Just <<< \_ -> onSelect tab.value
  ]
  [ HH.text tab.text ]

render :: forall t p f. Eq t => Props t f -> Array (Tab t) -> HH.HTML p f
render props tabs =
  HH.ul_ $ tabs <#> renderTab props
