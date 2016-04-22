module Button (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Signal exposing (Address, message)
import Debug exposing (log)
import Mailboxes exposing (addresses)
import Counter exposing (Action)


-- Model


type alias Model =
  { value : Int
  }


initialModel : Model
initialModel =
  { value = 3
  }


type Actioner
  = NoOp
  | Click



-- Update


update : Actioner -> Model -> Model
update action model =
  case action of
    NoOp ->
      model

    Click ->
      log "Clicked it" model



-- View


view : Address Actioner -> Model -> Html
view address model =
  button
    [ type' "button"
    , onClick addresses.click
    ]
    [ text "Clicked it up!" ]
