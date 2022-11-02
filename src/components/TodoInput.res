open Belt

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
  let (value, setValue) = React.useState(_ => "")

  let onChange = e => {
    let v = e->getValue
    setValue(_ => v)
  }

  let reset = () => setValue(_ => "")

  let submit = e => {
    e->ReactEvent.Synthetic.preventDefault
    value->Filter.emptyStr->Option.map(addTodo)->ignore
    reset()
  }

  <form onSubmit=submit>
    <Container>
      <Input value onChange />
      <Button type_="submit"> {`추가`->React.string} </Button>
    </Container>
  </form>
}
