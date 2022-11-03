@react.component
let make = (~defaultValue, ~visible, ~close, ~save) => {
  let (value, setValue) = React.useState(_ => defaultValue)

  let onChange = e => {
    let v = (e->ReactEvent.Synthetic.currentTarget)["value"]
    setValue(_ => v)
  }

  let submit = e => {
    e->ReactEvent.Synthetic.preventDefault
    value->Filter.emptyStr->Option.map(save)->ignore
    close()
  }

  <Rodal visible onClose=close>
    <div className="modal-content">
      <form onSubmit=submit>
        <input className="modal-input" value onChange />
        <div className="modal-buttons-container">
          <button className="modal-button" onClick={_ => close()}>
            {`취소`->React.string}
          </button>
          <button className="modal-button" type_="submit"> {`저장`->React.string} </button>
        </div>
      </form>
    </div>
  </Rodal>
}
