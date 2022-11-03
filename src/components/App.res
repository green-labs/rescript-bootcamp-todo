open TodoEntity

module IntComparator = Id.MakeComparable({
  type t = int
  let cmp = (a, b) => Pervasives.compare(a, b)
})

@react.component
let make = () => {
  let (todoMap, setTodoMap) = React.useState(_ => Map.make(~id=module(IntComparator)))
  let (filter, setFilter) = React.useState(_ => All)

  let handleAddTodo = text => {
    setTodoMap(prev => prev->TodoEntity.add(text))
  }

  let handleRemoveTodo = id => {
    setTodoMap(prev => prev->TodoEntity.remove(id))
  }

  let handleUpdateTodo = (id, payload) => {
    setTodoMap(prev => prev->TodoEntity.update(id, payload))
  }

  let handleSelectFilter = f => setFilter(_ => f)

  <div className="app">
    <h1 className="app-title"> {`RESCRIPT TO DO`->React.string} </h1>
    <TodoInput addTodo=handleAddTodo />
    <TodoFilter value=filter onChange=handleSelectFilter />
    <ol className="list-container">
      {todoMap
      ->TodoEntity.keep(filter)
      ->Map.toArray
      ->Array.map(((id, todo)) => {
        <TodoListItem
          key={id->Int.toString} todo removeTodo=handleRemoveTodo updateTodo=handleUpdateTodo
        />
      })
      ->React.array}
    </ol>
  </div>
}
