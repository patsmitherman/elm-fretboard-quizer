module TimeDisplay exposing (..)

import Html exposing (..)
import Html.Attributes as HtmlAttr exposing (..)
import Styles exposing (..)
import Model exposing (..)
import Types exposing (..)


timeDisplay : Model -> Html Msg
timeDisplay model =
    div [ HtmlAttr.style Styles.timeDisplayStyle ]
        (List.concat
            [ (List.repeat (round model.time) (timeSegmentTicked model))
            , (List.repeat (model.seconds - (round model.time)) (timeSegment model))
            ]
        )


timeSegment : Model -> Html Msg
timeSegment model =
    div [ HtmlAttr.style Styles.timeSegmentStyle ] []


timeSegmentTicked : Model -> Html Msg
timeSegmentTicked model =
    div [ HtmlAttr.style Styles.timeSegmentTickedStyle ] []
