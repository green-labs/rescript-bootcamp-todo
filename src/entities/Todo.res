type status =
  | ToDo
  | Done

type todo = {
  text: string,
  status: status,
}
