let getValue = e => (e->ReactEvent.Form.currentTarget)["value"]

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

  <div className="todoForm">
    <input value=todo onChange />
    <button onClick=onClickAdd> {`추가`->React.string} </button>
  </div>
}
