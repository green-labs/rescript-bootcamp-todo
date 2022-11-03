// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Belt_Map from "rescript/lib/es6/belt_Map.js";
import * as Belt_List from "rescript/lib/es6/belt_List.js";

function add(todoMap, text) {
  var match = Belt_List.head(Belt_List.reverse(Belt_Map.toList(todoMap)));
  var id = match !== undefined ? match[0] + 1 | 0 : 1;
  var todo = {
    id: id,
    text: text,
    status: /* Todo */0
  };
  return Belt_Map.set(todoMap, id, todo);
}

var remove = Belt_Map.remove;

var update = Belt_Map.set;

function keep(todoMap, filter) {
  return Belt_Map.keep(todoMap, (function (_id, param) {
                var status = param.status;
                switch (filter) {
                  case /* All */0 :
                      return true;
                  case /* TodoOnly */1 :
                      return status === /* Todo */0;
                  case /* DoneOnly */2 :
                      return status === /* Done */1;
                  
                }
              }));
}

export {
  add ,
  remove ,
  update ,
  keep ,
}
/* No side effect */
