@react.component
let make = (~addTodo) => {
  let (value, setValue) = React.useState(_ => "")

  let onChange = e => {
    let v = (e->ReactEvent.Synthetic.currentTarget)["value"]
    setValue(_ => v)
  }

  let reset = () => setValue(_ => "")

  let submit = e => {
    e->ReactEvent.Synthetic.preventDefault
    value->Filter.emptyStr->Option.map(addTodo)->ignore
    reset()
  }

  <form onSubmit=submit>
    <div className="todo-input-container">
      <input value onChange />
      <button type_="submit"> {`추가`->React.string} </button>
    </div>
  </form>
}
