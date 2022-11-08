@react.component
let make = (~todo) => {
  <li className="todo-list-item-container">
    <div className="todo-list-item-content">
      <div> {todo->React.string} </div>
    </div>
  </li>
}
