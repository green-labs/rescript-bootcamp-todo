// 1. App.res에 todos-state를 만들고,
//    TodoInput으로부터 입력받은 todo가 todos-state에 추가될 수 있도록 구현
// 2. 입력받은 todos-state를 기반으로 리스트형태로 그려지도록 컴포넌트 구현
//

@react.component
let make = () => {
  <div className="app">
    <div className="flex justify-between items-center mb-5">
      <h1 className="app-title"> {`RESCRIPT TO DO`->React.string} </h1>
      <User />
    </div>
    <TodoInput />
    <ol className="list-container"> {<> </>} </ol>
  </div>
}
