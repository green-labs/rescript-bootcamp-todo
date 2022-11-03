type status =
  | Todo
  | Done

type filter =
  | All
  | TodoOnly
  | DoneOnly

type todo = {
  id: int,
  text: string,
  status: status,
}

let add = (todoArr, text) => {
  let id = {
    switch todoArr->List.fromArray->List.reverse->List.head {
    | None => 1
    | Some(last) => last.id + 1
    }
  }

  todoArr->Array.concat([
    {
      id,
      text,
      status: Todo,
    },
  ])
}

let remove = (todoArr, id) => {
  todoArr->Array.keep(todo => todo.id != id)
}

let update = (todoArr, todo) => {
  todoArr->Array.map(t => t.id == todo.id ? todo : t)
}
