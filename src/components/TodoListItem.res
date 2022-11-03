open TodoEntity

@react.component
let make = (~todo, ~removeTodo, ~updateTodo) => {
  let {id, text, status} = todo

  let (showEditor, setShowEditor) = React.useState(_ => false)

  let toggleStatus = id => {
    id->updateTodo({
      id,
      text,
      status: switch status {
      | Todo => Done
      | Done => Todo
      },
    })
  }

  let saveTodo = (id, value) => {
    id->updateTodo({
      id,
      text: value,
      status,
    })
  }

  <>
    <li className="todo-list-item-container">
      <div className="todo-list-item-content" onClick={_ => id->toggleStatus}>
        <span className="todo-list-item-id"> {id->Belt.Int.toString->React.string} </span>
        <div
          className={switch status {
          | Todo => "todo-list-item-text-todo"
          | Done => "todo-list-item-text-done"
          }}>
          {text->React.string}
        </div>
      </div>
      <button className="todo-list-item-button" onClick={_ => setShowEditor(_ => true)}>
        {`수정`->React.string}
      </button>
      <button className="todo-list-item-button" onClick={_ => id->removeTodo}>
        {`삭제`->React.string}
      </button>
    </li>
    <EditTodo
      key=text
      defaultValue=text
      visible=showEditor
      close={_ => setShowEditor(_ => false)}
      save={v => saveTodo(id, v)}
    />
  </>
}
