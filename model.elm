module Model exposing (..)

import Dict exposing (..)
import Types exposing (..)


initialString : Str
initialString =
    { string = 1
    , name = "1st String"
    , frets =
        [ { id = 1, fret = 0, names = [ "E", "Fb" ] }
        , { id = 2, fret = 1, names = [ "F", "E#" ] }
        , { id = 3, fret = 2, names = [ "F#", "Gb" ] }
        , { id = 4, fret = 3, names = [ "G" ] }
        , { id = 5, fret = 4, names = [ "G#", "Ab" ] }
        , { id = 6, fret = 5, names = [ "A" ] }
        , { id = 7, fret = 6, names = [ "A#", "Bb" ] }
        , { id = 8, fret = 7, names = [ "B", "Cb" ] }
        , { id = 9, fret = 8, names = [ "C", "B#" ] }
        , { id = 10, fret = 9, names = [ "C#", "Db" ] }
        , { id = 11, fret = 10, names = [ "D" ] }
        , { id = 12, fret = 11, names = [ "D#", "Eb" ] }
        , { id = 13, fret = 12, names = [ "E", "Fb" ] }
        , { id = 14, fret = 13, names = [ "F", "E#" ] }
        , { id = 15, fret = 14, names = [ "F#", "Gb" ] }
        , { id = 16, fret = 15, names = [ "G" ] }
        , { id = 17, fret = 16, names = [ "G#", "Ab" ] }
        , { id = 18, fret = 17, names = [ "A" ] }
        , { id = 19, fret = 18, names = [ "A#", "Bb" ] }
        , { id = 20, fret = 19, names = [ "B", "Cb" ] }
        , { id = 21, fret = 20, names = [ "C", "B#" ] }
        , { id = 22, fret = 21, names = [ "C#", "Db" ] }
        , { id = 23, fret = 22, names = [ "D" ] }
        , { id = 24, fret = 23, names = [ "D#", "Eb" ] }
        , { id = 25, fret = 24, names = [ "E", "Fb" ] }
        ]
    }


initialFret : Fret
initialFret =
    { id = 1
    , fret = 0
    , names = [ "E", "Fb" ]
    }


model : Model
model =
    { notes =
        fromList
            [ ( 1, "A" )
            , ( 2, "B" )
            , ( 3, "C" )
            , ( 4, "D" )
            , ( 5, "E" )
            , ( 6, "F" )
            , ( 7, "G" )
            ]
    , accidentals =
        fromList
            [ ( 1, "" )
            , ( 2, "#" )
            , ( 3, "b" )
            ]
    , stringNodePos =
        fromList
            [ ( 1, "225" )
            , ( 2, "184" )
            , ( 3, "143" )
            , ( 4, "102" )
            , ( 5, "61" )
            , ( 6, "20" )
            ]
    , currentNote = ""
    , currentAccidental = ""
    , currentString =
        initialString
    , currentFret =
        initialFret
    , seconds = 1
    , time = 0
    , timeDict =
        fromList
            [ ( "1", 1 )
            , ( "2", 2 )
            , ( "3", 3 )
            , ( "4", 4 )
            , ( "5", 5 )
            , ( "6", 6 )
            , ( "7", 7 )
            , ( "8", 8 )
            , ( "9", 9 )
            , ( "10", 10 )
            ]
    , isRunning = True
    , strings =
        [ { string = 1
          , name = "1st String"
          , frets =
                [ { id = 1, fret = 0, names = [ "E", "Fb" ] }
                , { id = 2, fret = 1, names = [ "F", "E#" ] }
                , { id = 3, fret = 2, names = [ "F#", "Gb" ] }
                , { id = 4, fret = 3, names = [ "G" ] }
                , { id = 5, fret = 4, names = [ "G#", "Ab" ] }
                , { id = 6, fret = 5, names = [ "A" ] }
                , { id = 7, fret = 6, names = [ "A#", "Bb" ] }
                , { id = 8, fret = 7, names = [ "B", "Cb" ] }
                , { id = 9, fret = 8, names = [ "C", "B#" ] }
                , { id = 10, fret = 9, names = [ "C#", "Db" ] }
                , { id = 11, fret = 10, names = [ "D" ] }
                , { id = 12, fret = 11, names = [ "D#", "Eb" ] }
                , { id = 13, fret = 12, names = [ "E", "Fb" ] }
                , { id = 14, fret = 13, names = [ "F", "E#" ] }
                , { id = 15, fret = 14, names = [ "F#", "Gb" ] }
                , { id = 16, fret = 15, names = [ "G" ] }
                , { id = 17, fret = 16, names = [ "G#", "Ab" ] }
                , { id = 18, fret = 17, names = [ "A" ] }
                , { id = 19, fret = 18, names = [ "A#", "Bb" ] }
                , { id = 20, fret = 19, names = [ "B", "Cb" ] }
                , { id = 21, fret = 20, names = [ "C", "B#" ] }
                , { id = 22, fret = 21, names = [ "C#", "Db" ] }
                , { id = 23, fret = 22, names = [ "D" ] }
                , { id = 24, fret = 23, names = [ "D#", "Eb" ] }
                , { id = 25, fret = 24, names = [ "E", "Fb" ] }
                ]
          }
        , { string = 2
          , name = "2nd String"
          , frets =
                [ { id = 26, fret = 0, names = [ "B", "Cb" ] }
                , { id = 27, fret = 1, names = [ "C", "B#" ] }
                , { id = 28, fret = 2, names = [ "C#", "Db" ] }
                , { id = 29, fret = 3, names = [ "D" ] }
                , { id = 30, fret = 4, names = [ "D#", "Eb" ] }
                , { id = 31, fret = 5, names = [ "E", "Fb" ] }
                , { id = 32, fret = 6, names = [ "F", "E#" ] }
                , { id = 33, fret = 7, names = [ "F#", "Gb" ] }
                , { id = 34, fret = 8, names = [ "G" ] }
                , { id = 35, fret = 9, names = [ "G#", "Ab" ] }
                , { id = 36, fret = 10, names = [ "A" ] }
                , { id = 37, fret = 11, names = [ "A#", "Bb" ] }
                , { id = 38, fret = 12, names = [ "B", "Cb" ] }
                , { id = 39, fret = 13, names = [ "C", "B#" ] }
                , { id = 40, fret = 14, names = [ "C#", "Db" ] }
                , { id = 41, fret = 15, names = [ "D" ] }
                , { id = 42, fret = 16, names = [ "D#", "Eb" ] }
                , { id = 43, fret = 17, names = [ "E", "Fb" ] }
                , { id = 44, fret = 18, names = [ "F", "E#" ] }
                , { id = 45, fret = 19, names = [ "F#", "Gb" ] }
                , { id = 46, fret = 20, names = [ "G" ] }
                , { id = 47, fret = 21, names = [ "G#", "Ab" ] }
                , { id = 48, fret = 22, names = [ "A" ] }
                , { id = 49, fret = 23, names = [ "A#", "Bb" ] }
                , { id = 50, fret = 24, names = [ "B", "Cb" ] }
                ]
          }
        , { string = 3
          , name = "3rd String"
          , frets =
                [ { id = 51, fret = 0, names = [ "G" ] }
                , { id = 52, fret = 1, names = [ "G#", "Ab" ] }
                , { id = 53, fret = 2, names = [ "A" ] }
                , { id = 54, fret = 3, names = [ "A#", "Bb" ] }
                , { id = 55, fret = 4, names = [ "B", "Cb" ] }
                , { id = 56, fret = 5, names = [ "C", "B#" ] }
                , { id = 57, fret = 6, names = [ "C#", "Db" ] }
                , { id = 58, fret = 7, names = [ "D" ] }
                , { id = 59, fret = 8, names = [ "D#", "Eb" ] }
                , { id = 60, fret = 9, names = [ "E", "Fb" ] }
                , { id = 61, fret = 10, names = [ "F", "E#" ] }
                , { id = 62, fret = 11, names = [ "F#", "Gb" ] }
                , { id = 63, fret = 12, names = [ "G" ] }
                , { id = 64, fret = 13, names = [ "G#", "Ab" ] }
                , { id = 65, fret = 14, names = [ "A" ] }
                , { id = 66, fret = 15, names = [ "A#", "Bb" ] }
                , { id = 67, fret = 16, names = [ "B", "Cb" ] }
                , { id = 68, fret = 17, names = [ "C", "B#" ] }
                , { id = 69, fret = 18, names = [ "C#", "Db" ] }
                , { id = 70, fret = 19, names = [ "D" ] }
                , { id = 71, fret = 20, names = [ "D#", "Eb" ] }
                , { id = 72, fret = 21, names = [ "E", "Fb" ] }
                , { id = 73, fret = 22, names = [ "F", "E#" ] }
                , { id = 74, fret = 23, names = [ "F#", "Gb" ] }
                , { id = 75, fret = 24, names = [ "G" ] }
                ]
          }
        , { string = 4
          , name = "4th String"
          , frets =
                [ { id = 76, fret = 0, names = [ "D" ] }
                , { id = 77, fret = 1, names = [ "D#", "Eb" ] }
                , { id = 78, fret = 2, names = [ "E", "Fb" ] }
                , { id = 79, fret = 3, names = [ "F", "E#" ] }
                , { id = 80, fret = 4, names = [ "F#", "Gb" ] }
                , { id = 81, fret = 5, names = [ "G" ] }
                , { id = 82, fret = 6, names = [ "G#", "Ab" ] }
                , { id = 83, fret = 7, names = [ "A" ] }
                , { id = 84, fret = 8, names = [ "A#", "Bb" ] }
                , { id = 85, fret = 9, names = [ "B", "Cb" ] }
                , { id = 86, fret = 10, names = [ "C", "B#" ] }
                , { id = 87, fret = 11, names = [ "C#", "Db" ] }
                , { id = 88, fret = 12, names = [ "D" ] }
                , { id = 89, fret = 13, names = [ "D#", "Eb" ] }
                , { id = 90, fret = 14, names = [ "E", "Fb" ] }
                , { id = 91, fret = 15, names = [ "F", "E#" ] }
                , { id = 92, fret = 16, names = [ "F#", "Gb" ] }
                , { id = 93, fret = 17, names = [ "G" ] }
                , { id = 94, fret = 18, names = [ "G#", "Ab" ] }
                , { id = 95, fret = 19, names = [ "A" ] }
                , { id = 96, fret = 20, names = [ "A#", "Bb" ] }
                , { id = 97, fret = 21, names = [ "B", "Cb" ] }
                , { id = 98, fret = 22, names = [ "C", "B#" ] }
                , { id = 99, fret = 23, names = [ "C#", "Db" ] }
                , { id = 100, fret = 24, names = [ "D" ] }
                ]
          }
        , { string = 5
          , name = "5th String"
          , frets =
                [ { id = 101, fret = 0, names = [ "A" ] }
                , { id = 102, fret = 1, names = [ "A#", "Bb" ] }
                , { id = 103, fret = 2, names = [ "B", "Cb" ] }
                , { id = 104, fret = 3, names = [ "C", "B#" ] }
                , { id = 105, fret = 4, names = [ "C#", "Db" ] }
                , { id = 106, fret = 5, names = [ "D" ] }
                , { id = 107, fret = 6, names = [ "D#", "Eb" ] }
                , { id = 108, fret = 7, names = [ "E", "Fb" ] }
                , { id = 109, fret = 8, names = [ "F", "E#" ] }
                , { id = 110, fret = 9, names = [ "F#", "Gb" ] }
                , { id = 111, fret = 10, names = [ "G" ] }
                , { id = 112, fret = 11, names = [ "G#", "Ab" ] }
                , { id = 113, fret = 12, names = [ "A" ] }
                , { id = 114, fret = 13, names = [ "A#", "Bb" ] }
                , { id = 115, fret = 14, names = [ "B", "Cb" ] }
                , { id = 116, fret = 15, names = [ "C", "B#" ] }
                , { id = 117, fret = 16, names = [ "C#", "Db" ] }
                , { id = 118, fret = 17, names = [ "D" ] }
                , { id = 119, fret = 18, names = [ "D#", "Eb" ] }
                , { id = 120, fret = 19, names = [ "E", "Fb" ] }
                , { id = 121, fret = 20, names = [ "F", "E#" ] }
                , { id = 122, fret = 21, names = [ "F#", "Gb" ] }
                , { id = 123, fret = 22, names = [ "G" ] }
                , { id = 124, fret = 23, names = [ "G#", "Ab" ] }
                , { id = 125, fret = 24, names = [ "A" ] }
                ]
          }
        , { string = 6
          , name = "6th String"
          , frets =
                [ { id = 126, fret = 0, names = [ "E", "Fb" ] }
                , { id = 127, fret = 1, names = [ "F", "E#" ] }
                , { id = 128, fret = 2, names = [ "F#", "Gb" ] }
                , { id = 129, fret = 3, names = [ "G" ] }
                , { id = 130, fret = 4, names = [ "G#", "Ab" ] }
                , { id = 131, fret = 5, names = [ "A" ] }
                , { id = 132, fret = 6, names = [ "A#", "Bb" ] }
                , { id = 133, fret = 7, names = [ "B", "Cb" ] }
                , { id = 134, fret = 8, names = [ "C", "B#" ] }
                , { id = 135, fret = 9, names = [ "C#", "Db" ] }
                , { id = 136, fret = 10, names = [ "D" ] }
                , { id = 137, fret = 11, names = [ "D#", "Eb" ] }
                , { id = 138, fret = 12, names = [ "E", "Fb" ] }
                , { id = 139, fret = 13, names = [ "F", "E#" ] }
                , { id = 140, fret = 14, names = [ "F#", "Gb" ] }
                , { id = 141, fret = 15, names = [ "G" ] }
                , { id = 142, fret = 16, names = [ "G#", "Ab" ] }
                , { id = 143, fret = 17, names = [ "A" ] }
                , { id = 144, fret = 18, names = [ "A#", "Bb" ] }
                , { id = 145, fret = 19, names = [ "B", "Cb" ] }
                , { id = 146, fret = 20, names = [ "C", "B#" ] }
                , { id = 147, fret = 21, names = [ "C#", "Db" ] }
                , { id = 148, fret = 22, names = [ "D" ] }
                , { id = 149, fret = 23, names = [ "D#", "Eb" ] }
                , { id = 150, fret = 24, names = [ "E", "Fb" ] }
                ]
          }
        ]
    }
