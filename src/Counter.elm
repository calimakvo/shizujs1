module Counter exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

main : Program Int Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }

-- MODEL定義
type alias Model =
    { counter : Int }

init : Int -> (Model, Cmd Msg)
init c =
    ( { counter = c }, Cmd.none )

-- Msg定義
type Msg
    = Increment
    | Decrement

-- MODEL更新
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Increment ->
            (
             { model | counter = model.counter + 1 }
            , Cmd.none
            )

        Decrement ->
            if model.counter > 0 then
                (
                 { model | counter = model.counter - 1 }
                , Cmd.none
                )
            else
                (model, Cmd.none)

-- VIEW
view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (String.fromInt model.counter) ]
        , button [ onClick Increment ] [ text "+" ]
        ]

subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
