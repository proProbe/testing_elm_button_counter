module Button (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Signal exposing (Address)
import Debug exposing (log)


-- Model


type alias Model =
  { value : Int
  }


initialModel : Model
initialModel =
  { value = 3
  }


type Action
  = NoOp
  | Increment



-- Update


update : Action -> Model -> Model
update action model =
  case action of
    NoOp ->
      model

    Increment ->
      log "incrementing" model



-- View


view : Address Action -> Model -> Html
view address model =
  button
    [ type' "button", onClick address Increment ]
    [ text "Increment it up!" ]
