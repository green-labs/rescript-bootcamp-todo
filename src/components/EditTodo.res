module Content = %styled.div(`
  width: 100%;
  height: 100%;
  padding: 24px 16px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  box-sizing: border-box;
`)

module Input = %styled.input(`
  margin: 0;
  padding: 0 12px;
  width: 100%;
  height: 30px;
  border: 1px solid #636077;
  border-radius: 8px;
  font-size: 13px;
`)

module Flex = %styled.div(`
  margin-top: 16px;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
`)

module Button = %styled.button(`
  background: #382a52;
  border-radius: 4px;
  color: #dddbe3;
  border: 1px solid #636077;
  cursor: pointer;
  padding: 4px 8px;
`)

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
    <Content>
      <form onSubmit=submit>
        <Input value onChange />
        <Flex>
          <Button onClick={_ => close()}> {`취소`->React.string} </Button>
          <Button type_="submit"> {`저장`->React.string} </Button>
        </Flex>
      </form>
    </Content>
  </Rodal>
}
