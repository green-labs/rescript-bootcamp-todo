// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as EditTodo from "./EditTodo.mjs";

function TodoListItem(Props) {
  var todo = Props.todo;
  var removeTodo = Props.removeTodo;
  var updateTodo = Props.updateTodo;
  var status = todo.status;
  var text = todo.text;
  var id = todo.id;
  var match = React.useState(function () {
        return false;
      });
  var setShowEditor = match[1];
  return React.createElement(React.Fragment, undefined, React.createElement("li", {
                  className: "todo-list-item-container"
                }, React.createElement("div", {
                      className: "todo-list-item-content",
                      onClick: (function (param) {
                          Curry._2(updateTodo, id, {
                                id: id,
                                text: text,
                                status: status ? /* Todo */0 : /* Done */1
                              });
                        })
                    }, React.createElement("span", {
                          className: "todo-list-item-id"
                        }, String(id)), React.createElement("div", {
                          className: status ? "todo-list-item-text-done" : "todo-list-item-text-todo"
                        }, text)), React.createElement("button", {
                      className: "todo-list-item-button",
                      onClick: (function (param) {
                          Curry._1(setShowEditor, (function (param) {
                                  return true;
                                }));
                        })
                    }, "수정"), React.createElement("button", {
                      className: "todo-list-item-button",
                      onClick: (function (param) {
                          Curry._1(removeTodo, id);
                        })
                    }, "삭제")), React.createElement(EditTodo.make, {
                  defaultValue: text,
                  visible: match[0],
                  close: (function (param) {
                      Curry._1(setShowEditor, (function (param) {
                              return false;
                            }));
                    }),
                  save: (function (v) {
                      Curry._2(updateTodo, id, {
                            id: id,
                            text: v,
                            status: status
                          });
                    }),
                  key: text
                }));
}

var make = TodoListItem;

export {
  make ,
}
/* react Not a pure module */
