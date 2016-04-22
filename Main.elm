module Main (..) where

import Html exposing (..)
import Signal exposing (Address, message)
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
  let
    counterAddress =
      Signal.forwardTo address Increment

    buttonAddress =
      Signal.forwardTo address Click
  in
    div
      []
      [ text model.msg
      , Counter.view counterAddress model.counter
      , Button.view buttonAddress model.button
      ]



-- Main
-- main =
--   StartApp.start
--     { model = initialModel
--     , update = update
--     , view = view
--     }


main : Signal Html
main =
  Signal.map (view actionsMailbox.address) model


model : Signal Model
model =
  Signal.foldp update initialModel actions


actionsMailbox : Signal.Mailbox Action
actionsMailbox =
  Signal.mailbox NoOp


actions : Signal Action
actions =
  actionsMailbox.signal
