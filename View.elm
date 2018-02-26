module View exposing (..)

import Update
import Model
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import EmojiConverter


view : Model.Model -> Html Update.Msg
view model =
    div
        []
        [ node "link" [ rel "stylesheet", href "stylesheets/main.css" ] []
        , nav
            []
            [ div
                [ class "nav-wrapper light-blue lighten-2" ]
                [ div [ class "brand-logo center" ] [ text "Elmoji Translator" ]
                ]
            ]
        , section
            [ class "container"
            ]
            [ viewInput, 
              viewToggle,
              viewOtherThing model
            ]
        ]

viewToggle = 
--    div [class "switch center"] [label [][text "Translate Text", input [type_ "checkbox"] [] , span [class "lever"] [], text "Translate Emoji"]]
    let
        labelNode =
            label []
                [ text "Translate Text"
                , input [type_ "checkbox", Html.Events.onClick Update.ToggleDirection ] []
                , span [class "lever"] []
                , text "Translate Emoji"
                ]
    in
    div [class "switch center"] [labelNode]


viewInput = 
    div
        [ class "input-field"
        ]
        [ input [ type_ "text", class "center", placeholder "Let's Translate!", onInput Update.SetCurrentText ] []
        ]

viewOtherThing model = 
    section 
        [ class "container" 
        , style [("backgroundColor", "pink")] 
        ]
        [ p [class "center output-text emoji-size"] [text (translateText model)]
        , p [] [ text "HELLO, HOW ARE YOU?" ]
        ]

translateText model =
    EmojiConverter.textToEmoji model.defaultKey model.currentText