module Main exposing (..)

import Html exposing (..)
import Html.Attributes as HtmlAttr exposing (..)
import Html.Events exposing (..)
import Random exposing (..)
import Time exposing (Time, second)
import List exposing (repeat)
import Dict exposing (..)
import Maybe exposing (..)
import Styles exposing (..)
import Model exposing (..)
import Types exposing (..)
import Fretboard exposing (..)
import TimeDisplay exposing (..)


main : Program Never Model Msg
main =
    program { view = view, update = update, init = init, subscriptions = subscriptions }



-- INIT


init : ( Model, Cmd Msg )
init =
    ( model, Cmd.none )



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    if model.isRunning then
        Time.every second Tick
    else
        Sub.none



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GenerateNote ->
            ( model, Random.generate DisplayNote (Random.int 1 150) )

        DisplayNote val ->
            let
                hasFret str =
                    List.filter (\fret -> fret.id == val) str.frets
                        |> List.length
                        |> (\x -> x > 0)

                maybeStr =
                    List.filter (\string -> hasFret string) model.strings
                        |> (\x -> List.head x)

                curStr =
                    case maybeStr of
                        Just val ->
                            val

                        Nothing ->
                            initialString

                maybeFret =
                    List.filter (\fret -> fret.id == val) curStr.frets
                        |> (\x -> List.head x)

                curFret =
                    case maybeFret of
                        Just val ->
                            val

                        Nothing ->
                            initialFret
            in
                ( { model | currentString = curStr, currentFret = curFret }, Cmd.none )

        Tick newTime ->
            { model | time = updateTime model }
                |> if model.time == (toFloat model.seconds) then
                    (update GenerateNote)
                   else
                    (\n -> ( n, Cmd.none ))

        UpdateSeconds val ->
            let
                maybe =
                    get val model.timeDict

                newTime =
                    case maybe of
                        Just newTime ->
                            newTime

                        Nothing ->
                            1
            in
                { model | seconds = newTime }
                    |> update Reset

        Reset ->
            ( { model | time = 0 }, Cmd.none )

        ToggleTimer ->
            ( { model | isRunning = (not model.isRunning) }, Cmd.none )


updateTime : Model -> Float
updateTime model =
    if model.time > toFloat (model.seconds - 1) then
        0
    else
        { model | time = model.time + 1 }
            |> .time



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [ HtmlAttr.style [ ( "padding", "10px" ), ( "display", "inline-block" ) ] ]
            [ h1Label ("Time: " ++ (toString model.time))
            , h1Label ("Speed: " ++ (toString model.seconds))
            , h1Label ("String: " ++ model.currentString.name)
            , h1Label ("Note: " ++ (toString model.currentFret.names))
            , h1Label ("Fret: " ++ (toString model.currentFret.fret))
            , div [ HtmlAttr.style Styles.resultStyle ]
                [ if model.isRunning then
                    button [ onClick ToggleTimer ] [ text "Stop" ]
                  else
                    button [ onClick ToggleTimer ] [ text "Run" ]
                ]
            , slider
            , timeDisplay model
            ]
        , fretboard model
        ]


h1Label : String -> Html Msg
h1Label val =
    h1 [ HtmlAttr.style Styles.resultStyle ] [ Html.text val ]


slider : Html Msg
slider =
    input
        [ HtmlAttr.type_ "range"
        , defaultValue "1"
        , HtmlAttr.min "1"
        , HtmlAttr.max "10"
        , HtmlAttr.step "1"
        , onInput UpdateSeconds
        ]
        []
