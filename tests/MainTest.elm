module MainTest exposing (..)

import Expect
import Main exposing (Msg(..), emptyModel, update)
import Test exposing (..)


updateTest : Test
updateTest =
    describe "update test"
        [ describe "Msg == Add"
            [ test "エントリーがないとき、new Taskと入力フィールドに書かれていれば、タスクが未完了の状態でエントリーに追加され、入力フィールドは空になりidはインクリメントされる" <|
                \_ ->
                    update Add { emptyModel | field = "new Task" }
                        |> Tuple.first
                        |> Expect.equal
                            { emptyModel
                                | entries =
                                    [ { description = "new Task"
                                      , completed = False
                                      , editing = False
                                      , id = 0
                                      }
                                    ]
                                , field = ""
                                , uid = 1
                            }
            , test "エントリーがないとき、入力フィールドが書かれていなければ、idはインクリメントされる" <|
                \_ ->
                    update Add { emptyModel | field = "" }
                        |> Tuple.first
                        |> Expect.equal
                            { emptyModel
                                | entries = []
                                , field = ""
                                , uid = 1
                            }
            ]
        ]
