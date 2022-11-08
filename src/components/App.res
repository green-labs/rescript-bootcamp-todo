@react.component
let make = () => {
  let (todos, setTodos) = React.useState(_ => [])

  let addTodo = todo => {
    setTodos(prev => prev->Array.concat([todo]))
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
        <TodoListItem key={idx->Int.toString} todo />
      })
      ->React.array}
    </ol>
  </div>
}
