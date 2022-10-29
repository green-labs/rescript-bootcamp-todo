open Belt
open Todo

@react.component
let make = () => {
  let (todos, setTodos) = React.Uncurried.useState(_ => todoSet)

  let handleAddTodo = todoText => {
    setTodos(.prev => prev->addTodo(todoText))
  }

  let handleRemoveTodo = todo => {
    setTodos(.prev => prev->removeTodo(todo))
  }

  let handleToggleStatus = todo => {
    setTodos(.prev => prev->toggleStatus(todo))
  }

  <div className="container">
    <h1 className="title"> {`RESCRIPT TO DO`->React.string} </h1>
    <TodoInput addTodo=handleAddTodo />
    <ol className="todosContainer">
      {todos
      ->Set.toArray
      ->Array.map(todo => {
        <TodoListItem
          key={todo.id->Int.toString}
          todo
          removeTodo=handleRemoveTodo
          toggleStatus=handleToggleStatus
        />
      })
      ->React.array}
    </ol>
  </div>
}
