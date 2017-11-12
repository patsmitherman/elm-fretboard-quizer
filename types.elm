module Types exposing (..)

import Time exposing (..)
import Dict exposing (..)


type alias Fret =
    { id : Int
    , fret : Int
    , names : List String
    }


type alias Str =
    { string : Int
    , name : String
    , frets : List Fret
    }


type alias Model =
    { notes : Dict Int String
    , accidentals : Dict Int String
    , stringNodePos : Dict Int String
    , strings : List Str
    , currentNote : String
    , currentAccidental : String
    , currentString : Str
    , currentFret : Fret
    , seconds : Int
    , time : Float
    , timeDict : Dict String Int
    , isRunning : Bool
    }


type Msg
    = DisplayNote Int
    | GenerateNote
    | Tick Time
    | UpdateSeconds String
    | Reset
    | ToggleTimer
