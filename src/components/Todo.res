open Belt

type status =
  | ToDo
  | Done

type t = {
  id: int,
  text: string,
  status: status,
}

module IdComparator = Id.MakeComparable({
  type t = t
  let cmp = (todoA, todoB) => Pervasives.compare(todoA.id, todoB.id)
})

let todoSet = Set.fromArray([], ~id=module(IdComparator))

let addTodo = (prev, text) => {
  let id = {
    switch prev->Set.toList->List.reverse->List.head {
    | None => 1
    | Some(last) => last.id + 1
    }
  }

  prev->Set.add({
    id,
    text,
    status: ToDo,
  })
}

let removeTodo = (prev, todo) => prev->Set.remove(todo)

let toggleStatus = (prev, todo) => {
  prev
  ->Set.remove(todo)
  ->Set.add({
    ...todo,
    status: switch todo.status {
    | ToDo => Done
    | Done => ToDo
    },
  })
}
