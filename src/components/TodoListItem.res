open Todo

@react.component
let make = (~todo, ~removeTodo, ~toggleStatus) => {
  let {id, text, status} = todo

  let onClickRemove = _ => todo->removeTodo

  let onClickTodo = _ => todo->toggleStatus

  <li className="todoItem">
    <div onClick=onClickTodo>
      <span> {id->Belt.Int.toString->React.string} </span>
      {switch status {
      | ToDo => <div> {text->React.string} </div>
      | Done => <div className="done"> {text->React.string} </div>
      }}
    </div>
    <button onClick=onClickRemove> {`삭제`->React.string} </button>
  </li>
}
