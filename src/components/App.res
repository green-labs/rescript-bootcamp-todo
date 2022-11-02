open Belt

module Container = %styled.div(`
  padding: 24px 16px;
  max-width: 500px;
`)

module Title = %styled.h1(`
  margin-bottom: 16px;
  font-size: 20px;
  color: #fff;
`)

module Ol = %styled.ol(`
  margin: 24px 0 0 0;
  padding: 0;
`)

module IntComparator = Id.MakeComparable({
  type t = int
  let cmp = (a, b) => Pervasives.compare(a, b)
})

@react.component
let make = () => {
  let (todoMap, setTodoMap) = React.useState(_ => Map.make(~id=module(IntComparator)))

  let handleAddTodo = text => {
    setTodoMap(prev => prev->TodoEntity.add(text))
  }

  let handleRemoveTodo = id => {
    setTodoMap(prev => prev->TodoEntity.remove(id))
  }

  let handleUpdateTodo = (id, payload) => {
    setTodoMap(prev => prev->TodoEntity.update(id, payload))
  }

  <Container>
    <Title> {`RESCRIPT TO DO`->React.string} </Title>
    <TodoInput addTodo=handleAddTodo />
    <Ol>
      {todoMap
      ->Map.toArray
      ->Array.map(((id, todo)) => {
        <TodoListItem
          key={id->Int.toString} todo removeTodo=handleRemoveTodo updateTodo=handleUpdateTodo
        />
      })
      ->React.array}
    </Ol>
  </Container>
}
