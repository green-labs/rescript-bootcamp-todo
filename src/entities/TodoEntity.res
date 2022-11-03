type status =
  | Todo
  | Done

type filter =
  | All
  | TodoOnly
  | DoneOnly

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
    status: Todo,
  }

  todoMap->Map.set(id, todo)
}

let remove = (todoMap, id) => {
  todoMap->Map.remove(id)
}

let update = (todoMap, id, payload) => {
  todoMap->Map.set(id, payload)
}

let keep = (todoMap, filter) => {
  todoMap->Map.keep((_id, {status}) => {
    switch filter {
    | All => true
    | TodoOnly if status == Todo => true
    | DoneOnly if status == Done => true
    | _ => false
    }
  })
}
