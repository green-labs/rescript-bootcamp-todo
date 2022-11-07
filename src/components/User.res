@react.component
let make = () => {
  let user = Auth.useUser()

  switch user {
  | None => React.null
  | Some(user') =>
    <div className="mb-2 flex gap-4">
      <div className="text-white flex items-center text-end">
        <div>
          {`${user'.firstName} ${user'.lastName}`->React.string}
          <div className="text-xs"> {`@${user'.userName}`->React.string} </div>
        </div>
      </div>
      <img src=user'.avatar alt="avatar" className="h-12 w-12 rounded-full ring-2" />
    </div>
  }
}
