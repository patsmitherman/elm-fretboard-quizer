module Styles exposing (..)


buttonStyle : List ( String, String )
buttonStyle =
    [ ( "padding", "10px" )
    , ( "border", "solid 1px" )
    , ( "border-radius", "5px" )
    , ( "width", "100px" )
    , ( "display", "block" )
    ]


resultStyle : List ( String, String )
resultStyle =
    [ ( "padding", "20px" )
    ]


timeDisplayStyle : List ( String, String )
timeDisplayStyle =
    [ ( "height", "102px" )
    , ( "border-left", "solid 1px #000" )
    ]


timeSegmentStyle : List ( String, String )
timeSegmentStyle =
    [ ( "width", "25px" )
    , ( "height", "100px" )
    , ( "border", "solid 1px #000" )
    , ( "border-left", "none" )
    , ( "backgroundColor", "#ccc" )
    , ( "display", "inline-block" )
    ]


timeSegmentTickedStyle : List ( String, String )
timeSegmentTickedStyle =
    [ ( "width", "25px" )
    , ( "height", "100px" )
    , ( "border", "solid 1px #000" )
    , ( "border-left", "none" )
    , ( "backgroundColor", "#00FF00" )
    , ( "display", "inline-block" )
    ]


neckWrapper : List ( String, String )
neckWrapper =
    [ ( "padding", "10px" )
    , ( "display", "inline-block" )
    , ( "position", "fixed" )
    , ( "left", "400px" )
    ]


svgFretStyle : List ( String, String )
svgFretStyle =
    [ ( "display", "block" ) ]


svgRectStyle : List ( String, String )
svgRectStyle =
    [ ( "fill", "#ccc" )
    , ( "stroke-width", "1" )
    , ( "stroke", "rgb(0,0,0)" )
    ]


noteStyle : List ( String, String )
noteStyle =
    [ ( "fill", "#00CC00" )
    , ( "stroke-width", "1" )
    , ( "stroke", "rgb(0,0,0)" )
    ]
