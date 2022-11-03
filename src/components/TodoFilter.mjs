// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";

function stringify(s) {
  switch (s) {
    case /* All */0 :
        return "all";
    case /* TodoOnly */1 :
        return "todo-only";
    case /* DoneOnly */2 :
        return "done-only";
    
  }
}

function makeLabel(f) {
  switch (f) {
    case /* All */0 :
        return "전체";
    case /* TodoOnly */1 :
        return "해야할 일";
    case /* DoneOnly */2 :
        return "완료한 일";
    
  }
}

function TodoFilter(Props) {
  var value = Props.value;
  var onChange = Props.onChange;
  return React.createElement("div", {
              className: "filter-container"
            }, Belt_Array.map([
                  /* All */0,
                  /* TodoOnly */1,
                  /* DoneOnly */2
                ], (function (v) {
                    var isSelected = value === v;
                    var onClick = function (param) {
                      Curry._1(onChange, v);
                    };
                    return React.createElement("button", {
                                key: stringify(v),
                                className: isSelected ? "filter-item-selected" : "filter-item",
                                onClick: onClick
                              }, makeLabel(v));
                  })));
}

var make = TodoFilter;

export {
  stringify ,
  makeLabel ,
  make ,
}
/* react Not a pure module */
