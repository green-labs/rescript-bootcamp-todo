open TodoHandler

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
  <div className="filter-container">
    {[All, TodoOnly, DoneOnly]
    ->Array.map(v => {
      let isSelected = value == v
      let onClick = _ => v->onChange
      <button
        key={v->stringify} className={isSelected ? "filter-item-selected" : "filter-item"} onClick>
        {v->makeLabel->React.string}
      </button>
    })
    ->React.array}
  </div>
}
