let getValue = e => (e->ReactEvent.Form.currentTarget)["value"]

module Container = %styled.div(`
  box-sizing: border-box;
  display: flex;
  align-items: center;
  width: 100%;
  height: 50px;
`)

module Input = %styled.input(`
  margin: 0;
  padding: 0 12px;
  width: 100%;
  height: 100%;
  border: 1px solid #636077;
  border-radius: 8px;
  font-size: 20px;
`)

module Button = %styled.button(`
  margin-left: 12px;
  width: 100px;
  height: 100%;
  background: #382a52;
  border-radius: 8px;
  color: #dddbe3;
  border: 1px solid #636077;
  cursor: pointer;
  font-size: 18px;
`)

@react.component
let make = (~addTodo) => {
  let (todo, setTodo) = React.Uncurried.useState(() => "")

  let onChange = event => {
    let value = event->getValue
    setTodo(._ => value)
  }

  let onClickAdd = _ => {
    if todo != "" {
      todo->addTodo
      setTodo(._ => "")
    }
  }

  <Container>
    <Input value=todo onChange />
    <Button onClick=onClickAdd> {`추가`->React.string} </Button>
  </Container>
}
