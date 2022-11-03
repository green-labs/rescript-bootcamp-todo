open TodoEntity

module Container = %styled.div(`
  margin-top: 16px;
  width: 100%;
  height: 50px;
  display: flex;
  align-items: center;
  gap: 16px;
`)

module Item = %styled.button(`
  width: 100%;
  height: 100%;
  border-radius: 8px;
  background: #382a52;
  color: #636077;
  border: none;
  cursor: pointer;
`)

module SelectedItem = %styled.button(`
width: 100%;
  height: 100%;
  border-radius: 8px;
  background: #382a52;
  color: #dddbe3;
  border: 1px solid #636077;
  cursor: pointer;
`)

let stringify = s => {
  switch s {
  | All => "all"
  | TodoOnly => "todo-only"
  | DoneOnly => "done-only"
  }
}

let makeLabel = f => {
  switch f {
  | All => "전체"
  | TodoOnly => "해야할 일"
  | DoneOnly => "완료한 일"
  }
}

@react.component
let make = (~value, ~onChange) => {
  <Container>
    {[All, TodoOnly, DoneOnly]
    ->Array.map(v => {
      let isSelected = value == v
      let onClick = _ => v->onChange

      isSelected
        ? <SelectedItem key={v->stringify}> {v->makeLabel->React.string} </SelectedItem>
        : <Item key={v->stringify} onClick> {v->makeLabel->React.string} </Item>
    })
    ->React.array}
  </Container>
}
