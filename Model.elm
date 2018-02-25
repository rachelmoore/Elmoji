module Model exposing (..)


type alias Model =
    { currentText : String, defaultKey: String }


init : Model
init =
    { currentText = "", defaultKey = "😅" }
