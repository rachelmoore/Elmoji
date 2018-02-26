module Model exposing (..)


type alias Model =
    { currentText : String, defaultKey: String, toggledStatus: Bool }


init : Model
init =
    { currentText = "", defaultKey = "😅", toggledStatus = True }
