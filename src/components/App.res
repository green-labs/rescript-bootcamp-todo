open Belt
open Todo

module Container = %styled.div(`
  max-width: 500px;
`)

module Title = %styled.h1(`
  font-size: 20px;
  color: #fff;
`)

module Ol = %styled.ol(`
  margin: 24px 0 0 0;
  padding: 0;
`)

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

  <Container>
    <Title> {`RESCRIPT TO DO`->React.string} </Title>
    <TodoInput addTodo=handleAddTodo />
    <Ol>
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
    </Ol>
  </Container>
}
