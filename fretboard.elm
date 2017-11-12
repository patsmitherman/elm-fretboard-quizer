module Fretboard exposing (..)

import Html exposing (..)
import Html.Attributes as HtmlAttr exposing (..)
import Styles exposing (..)
import Svg exposing (..)
import Svg.Attributes as SvgAttr exposing (..)
import Types exposing (..)
import Dict exposing (..)


fretboard : Model -> Html Msg
fretboard model =
    let
        fret =
            fretSvg model []

        fretWithMarker =
            fretWithMarkerSvg model

        fretWithOctiveMarker =
            fretWithOctiveMarkerSvg model
    in
        div [ HtmlAttr.style neckWrapper ]
            [ fret 1
            , fret 2
            , fretWithMarker 3
            , fret 4
            , fretWithMarker 5
            , fret 6
            , fretWithMarker 7
            , fret 8
            , fretWithMarker 9
            , fret 10
            , fret 11
            , fretWithOctiveMarker 12
            , fret 13
            , fret 14
            , fretWithMarker 15
            , fret 16
            , fretWithMarker 17
            , fret 18
            , fretWithMarker 19
            , fret 20
            , fretWithMarker 21
            , fret 22
            , fret 23
            , fretWithOctiveMarker 24
            ]


fretSvgAttrs : List (Html.Attribute msg)
fretSvgAttrs =
    [ SvgAttr.width "246", SvgAttr.height "32", HtmlAttr.style Styles.svgFretStyle ]


fretSvg : Model -> List (Svg Msg) -> Int -> Html Msg
fretSvg model markers fretPos =
    svg fretSvgAttrs
        (List.append
            [ rect [ SvgAttr.width "246", SvgAttr.height "32", HtmlAttr.style svgRectStyle ] []
            , stringLine "20"
            , stringLine "61"
            , stringLine "102"
            , stringLine "143"
            , stringLine "184"
            , stringLine "225"
            , (if model.currentFret.fret == fretPos then
                (noteSvg fretPos model)
               else
                noNoteSvg
              )
            ]
            markers
        )


stringLine : String -> Svg msg
stringLine xPos =
    line [ x1 xPos, y1 "0", x2 xPos, y2 "32", SvgAttr.strokeWidth "2", stroke "black" ] []


fretWithMarkerSvg : Model -> Int -> Html Msg
fretWithMarkerSvg model fretPos =
    svg fretSvgAttrs [ fretSvg model [ (circle [ cx "123", cy "16", r "8" ] []) ] fretPos ]


fretWithOctiveMarkerSvg : Model -> Int -> Html Msg
fretWithOctiveMarkerSvg model fretPos =
    svg fretSvgAttrs
        [ fretSvg
            model
            [ (circle [ cx "83", cy "16", r "8" ] [])
            , (circle [ cx "163", cy "16", r "8" ] [])
            ]
            fretPos
        ]


noteSvg : Int -> Model -> Html Msg
noteSvg fretPos model =
    let
        maybe =
            (Dict.get model.currentString.string model.stringNodePos)

        xPos =
            case maybe of
                Just xPos ->
                    xPos

                Nothing ->
                    "20"
    in
        circle [ cx xPos, cy "16", r "10", HtmlAttr.style noteStyle ] []


noNoteSvg : Html Msg
noNoteSvg =
    circle [] []
