open Todo

module Container = %styled.li(`
  margin-top: 8px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  color: #dddbe3;
`)

module Content = %styled.div(`
  display: flex;
  align-items: center;
  cursor: pointer;
  flex: 1;
`)

module Id = %styled.span(`
  margin-right: 8px;
  width: 30px;
  height: 30px;
  border-radius: 8px;
  background: #3e3264;
  display: flex;
  justify-content: center;
  align-items: center;
`)

module TodoTitle = %styled.div(`
  display: flex;
  flex: 1;
`)

module DoneTitle = %styled.div(`
  display: flex;
  flex: 1;
  text-align: left;
  text-decoration-line: line-through;
`)

module Button = %styled.button(`
  background: #382a52;
  border-radius: 4px;
  color: #dddbe3;
  border: 1px solid #636077;
  cursor: pointer;
`)

@react.component
let make = (~todo, ~removeTodo, ~toggleStatus) => {
  let {id, text, status} = todo
  let onClickRemove = _ => todo->removeTodo
  let onClickTodo = _ => todo->toggleStatus

  <Container>
    <Content onClick=onClickTodo>
      <Id> {id->Belt.Int.toString->React.string} </Id>
      {switch status {
      | ToDo => <TodoTitle> {text->React.string} </TodoTitle>
      | Done => <DoneTitle> {text->React.string} </DoneTitle>
      }}
    </Content>
    <Button onClick=onClickRemove> {`삭제`->React.string} </Button>
  </Container>
}
