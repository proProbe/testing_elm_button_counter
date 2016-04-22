module Mailboxes (..) where

import Signal exposing (Address, Mailbox)
import Counter exposing (Action(Increment))


type alias Addresses =
  { click : Address Action
  }


addresses : Addresses
addresses =
  { click = click.address
  }


type alias Signals =
  { click : Signal Action
  }


signals : Signals
signals =
  { click = click.signal
  }


click : Mailbox Action
click =
  Signal.mailbox (Increment 1)
