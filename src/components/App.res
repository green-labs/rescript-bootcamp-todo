@react.component
let make = () => {
  let (todos, setTodos) = React.useState(_ => [])
  let (filter, setFilter) = React.useState(_ => TodoHandler.All)

  let handleAddTodo = text => {
    setTodos(prev => prev->TodoHandler.add(text))
  }

  let handleRemoveTodo = id => {
    setTodos(prev => prev->TodoHandler.remove(id))
  }

  let handleUpdateTodo = todo => {
    setTodos(prev => prev->TodoHandler.update(todo))
  }

  let handleSelectFilter = f => setFilter(_ => f)

  <div className="app">
    <h1 className="app-title"> {`RESCRIPT TO DO`->React.string} </h1>
    <TodoInput addTodo=handleAddTodo />
    <TodoFilter value=filter onChange=handleSelectFilter />
    <ol className="list-container">
      {todos
      ->Array.keep(t => {
        switch filter {
        | All => true
        | TodoOnly if t.status == Todo => true
        | DoneOnly if t.status == Done => true
        | _ => false
        }
      })
      ->Array.map(todo => {
        <TodoListItem
          key={todo.id->Int.toString} todo removeTodo=handleRemoveTodo updateTodo=handleUpdateTodo
        />
      })
      ->React.array}
    </ol>
  </div>
}
