@react.component
let make = () => {
  let (value, _) = React.useState(_ => "")

  <form
    onSubmit={e => {
      e->ReactEvent.Synthetic.preventDefault
    }}>
    <div className="todo-input-container">
      <input
        value
        onChange={e => {
          let target = e->ReactEvent.Synthetic.currentTarget
          target["value"]->Js.log
        }}
      />
      <button type_="submit"> {`추가`->React.string} </button>
    </div>
  </form>
}
