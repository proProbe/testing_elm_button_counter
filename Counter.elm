module Counter (..) where

import Html exposing (..)
import Signal exposing (Address)


-- Model


type alias Model =
  { count : Int
  }


initialModel : Model
initialModel =
  { count = 1
  }



-- Types


type Action
  = NoOp
  | Increment Int



-- Update


update : Action -> Model -> Model
update action model =
  case action of
    NoOp ->
      model

    Increment int ->
      let
        newCount =
          model.count + int

        newModel =
          { model | count = newCount }
      in
        newModel



-- View


view : Address Action -> Model -> Html
view address model =
  div
    []
    [ text (toString model.count)
    ]
