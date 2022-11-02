open TodoEntity

module Container = %styled.li(`
  margin-top: 8px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  color: #dddbe3;
  gap: 8px;
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
let make = (~todo, ~removeTodo, ~updateTodo) => {
  let {id, text, status} = todo

  let (showEditor, setShowEditor) = React.useState(_ => false)

  let toggleStatus = id => {
    id->updateTodo({
      id,
      text,
      status: switch status {
      | ToDo => Done
      | Done => ToDo
      },
    })
  }

  let saveTodo = (id, value) => {
    id->updateTodo({
      id,
      text: value,
      status,
    })
  }

  <>
    <Container>
      <Content onClick={_ => id->toggleStatus}>
        <Id> {id->Belt.Int.toString->React.string} </Id>
        {switch status {
        | ToDo => <TodoTitle> {text->React.string} </TodoTitle>
        | Done => <DoneTitle> {text->React.string} </DoneTitle>
        }}
      </Content>
      <Button onClick={_ => setShowEditor(_ => true)}> {`수정`->React.string} </Button>
      <Button onClick={_ => id->removeTodo}> {`삭제`->React.string} </Button>
    </Container>
    <EditTodo
      key=text
      defaultValue=text
      visible=showEditor
      close={_ => setShowEditor(_ => false)}
      save={v => saveTodo(id, v)}
    />
  </>
}
