@react.component
let make = () => {
  let (value, _) = React.useState(_ => "")

  <form
    onSubmit={e => {
      // JS: e.preventDefault()
      e->ReactEvent.Synthetic.preventDefault
    }}>
    <div className="todo-input-container">
      <input
        value
        onChange={e => {
          // JS: e.target["value"]
          let target = e->ReactEvent.Synthetic.currentTarget
          let _v = target["value"]
        }}
      />
      <button type_="submit"> {`추가`->React.string} </button>
    </div>
  </form>
}
