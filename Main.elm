module Main (..) where

import Html exposing (..)
import StartApp.Simple as StartApp
import Signal exposing (Address)
import Counter
import Button


-- Model


type alias Model =
  { msg : String
  , counter : Counter.Model
  , button : Button.Model
  }


initialModel : Model
initialModel =
  { msg = "Hello counter!"
  , counter = Counter.initialModel
  , button = Button.initialModel
  }



-- Types


type Action
  = NoOp
  | Increment Counter.Action
  | Click Button.Action



-- Update


update : Action -> Model -> Model
update action model =
  case action of
    NoOp ->
      model

    Increment subAction ->
      let
        newModel =
          { model | counter = Counter.update subAction model.counter }
      in
        newModel

    Click subAction ->
      let
        newModel =
          { model | button = Button.update subAction model.button }
      in
        newModel



-- View


view : Address Action -> Model -> Html
view address model =
  div
    []
    [ text model.msg
    , Counter.view (Signal.forwardTo address Increment) model.counter
    , Button.view (Signal.forwardTo address Click) model.button
    ]



-- Main


main =
  StartApp.start
    { model = initialModel
    , update = update
    , view = view
    }
