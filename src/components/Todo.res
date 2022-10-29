open Belt

type status =
  | ToDo
  | Done

type todo = {
  id: int,
  text: string,
  status: status,
}

// Set이 너무 어려울까?
module IdComparator = Id.MakeComparable({
  type t = todo
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
