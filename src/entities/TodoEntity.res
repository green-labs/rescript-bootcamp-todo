open Belt

type status =
  | ToDo
  | Done

type t = {
  id: int,
  text: string,
  status: status,
}

let add = (todoMap, text) => {
  let id = {
    switch todoMap->Map.toList->List.reverse->List.head {
    | None => 1
    | Some((last, _)) => last + 1
    }
  }

  let todo = {
    id,
    text,
    status: ToDo,
  }

  todoMap->Map.set(id, todo)
}

let remove = (todoMap, id) => {
  todoMap->Map.remove(id)
}

let update = (todoMap, id, payload) => {
  todoMap->Map.set(id, payload)
}
