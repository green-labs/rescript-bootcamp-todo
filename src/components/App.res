@react.component
let make = () => {
  let (todos, setTodos) = React.useState((_): array<Todo.todo> => [])

  let addTodo = text => {
    setTodos(prev => {
      prev->Array.concat([
        {
          text,
          status: ToDo,
        },
      ])
    })
  }

  let toggleTodo = targetIdx => {
    setTodos(prev => {
      prev->Array.mapWithIndex((idx, todo) => {
        if targetIdx != idx {
          todo
        } else {
          {
            ...todo,
            status: switch todo.status {
            | ToDo => Done
            | Done => ToDo
            },
          }
        }
      })
    })
  }

  <div className="app">
    <div className="flex justify-between items-center mb-5">
      <h1 className="app-title"> {`RESCRIPT TO DO`->React.string} </h1>
      <User />
    </div>
    <TodoInput addTodo />
    <ol className="list-container">
      {todos
      ->Array.mapWithIndex((idx, todo) => {
        let onClick = _ => toggleTodo(idx)
        <TodoListItem key={idx->Int.toString} todo onClick />
      })
      ->React.array}
    </ol>
  </div>
}
