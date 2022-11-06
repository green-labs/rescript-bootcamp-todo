// Generated by ReScript, PLEASE EDIT WITH CARE

import * as User from "./User.mjs";
import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as TodoInput from "./TodoInput.mjs";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as TodoFilter from "./TodoFilter.mjs";
import * as TodoHandler from "../entities/TodoHandler.mjs";
import * as TodoListItem from "./TodoListItem.mjs";

function App(Props) {
  var match = React.useState(function () {
        return [];
      });
  var setTodos = match[1];
  var match$1 = React.useState(function () {
        return /* All */0;
      });
  var setFilter = match$1[1];
  var filter = match$1[0];
  var handleAddTodo = function (text) {
    Curry._1(setTodos, (function (prev) {
            return TodoHandler.add(prev, text);
          }));
  };
  var handleRemoveTodo = function (id) {
    Curry._1(setTodos, (function (prev) {
            return TodoHandler.remove(prev, id);
          }));
  };
  var handleUpdateTodo = function (todo) {
    Curry._1(setTodos, (function (prev) {
            return TodoHandler.update(prev, todo);
          }));
  };
  var handleSelectFilter = function (f) {
    Curry._1(setFilter, (function (param) {
            return f;
          }));
  };
  return React.createElement("div", {
              className: "app"
            }, React.createElement("div", {
                  className: "flex justify-between items-center mb-5"
                }, React.createElement("h1", {
                      className: "app-title"
                    }, "RESCRIPT TO DO"), React.createElement(User.make, {})), React.createElement(TodoInput.make, {
                  addTodo: handleAddTodo
                }), React.createElement(TodoFilter.make, {
                  value: filter,
                  onChange: handleSelectFilter
                }), React.createElement("ol", {
                  className: "list-container"
                }, Belt_Array.map(Belt_Array.keep(match[0], (function (t) {
                            switch (filter) {
                              case /* All */0 :
                                  return true;
                              case /* TodoOnly */1 :
                                  return t.status === /* Todo */0;
                              case /* DoneOnly */2 :
                                  return t.status === /* Done */1;
                              
                            }
                          })), (function (todo) {
                        return React.createElement(TodoListItem.make, {
                                    todo: todo,
                                    removeTodo: handleRemoveTodo,
                                    updateTodo: handleUpdateTodo,
                                    key: String(todo.id)
                                  });
                      }))));
}

var make = App;

export {
  make ,
}
/* User Not a pure module */
