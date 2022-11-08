@react.component
let make = (~addTodo) => {
  let (value, setValue) = React.useState(_ => "")

  let reset = () => setValue(_ => "")

  let submit = e => {
    e->ReactEvent.Synthetic.preventDefault
    value->addTodo
    reset()
  }

  let onChange = e => {
    let target = e->ReactEvent.Synthetic.currentTarget
    setValue(_ => target["value"])
  }

  <form onSubmit=submit>
    <div className="todo-input-container">
      <input value onChange />
      <button type_="submit"> {`추가`->React.string} </button>
    </div>
  </form>
}
