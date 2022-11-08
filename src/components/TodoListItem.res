@react.component
let make = (~todo: Todo.todo, ~onClick) => {
  <li className="todo-list-item-container" onClick>
    <div className="todo-list-item-content">
      <div
        className={switch todo.status {
        | ToDo => "todo-list-item-text-todo"
        | Done => "todo-list-item-text-done"
        }}>
        {todo.text->React.string}
      </div>
    </div>
  </li>
}
