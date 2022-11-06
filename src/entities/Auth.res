@decco
type user = {
  @decco.key("first_name") firstName: string,
  @decco.key("last_name") lastName: string,
  @decco.key("username") userName: string,
  avatar: string,
}

open Js.Promise
let useUser = () => {
  let (user, setUser) = React.useState(_ => None)

  React.useEffect1(_ => {
    Fetch.fetch("https://random-data-api.com/api/v2/users?size=1")
    |> then_(Fetch.Response.json)
    |> then_(json => {
      switch json->user_decode {
      | Ok(user') => setUser(_ => Some(user'))
      | Error(str) => Js.log(str)
      }
      resolve()
    })
    |> ignore

    None
  }, [setUser])

  user
}
