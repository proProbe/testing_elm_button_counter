module Mailboxes (..) where

import Signal exposing (Address, Mailbox)


type alias Addresses =
  { click : Address ()
  }


addresses : Addresses
addresses =
  { click = click.address
  }


type alias Signals =
  { click : Signal ()
  }


signals : Signals
signals =
  { click = click.signal
  }


click : Mailbox ()
click =
  Signal.mailbox ()
