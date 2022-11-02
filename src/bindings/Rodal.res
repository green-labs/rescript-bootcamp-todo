@module("rodal") @react.component
external make: (
  ~visible: bool=?,
  ~onClose: unit => unit=?,
  ~children: React.element,
) => React.element = "default"
