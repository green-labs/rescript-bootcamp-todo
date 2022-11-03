// Generated by ReScript, PLEASE EDIT WITH CARE

import * as CssJs from "bs-css-emotion/src/CssJs.mjs";
import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";

var deleteProp = ((newProps, key) => delete newProps[key]);

function getOrEmpty(str) {
  if (str !== undefined) {
    return " " + str;
  } else {
    return "";
  }
}

var styles = CssJs.style([
      CssJs.label("Container"),
      CssJs.marginTop({
            NAME: "pxFloat",
            VAL: 16
          }),
      CssJs.width({
            NAME: "percent",
            VAL: 100
          }),
      CssJs.height({
            NAME: "pxFloat",
            VAL: 50
          }),
      CssJs.display("flex"),
      CssJs.unsafe("alignItems", "center"),
      CssJs.unsafe("gap", "16px")
    ]);

function make(props) {
  var className = styles + getOrEmpty(Caml_option.undefined_to_opt(props.className));
  var stylesObject = {
    className: className,
    ref: Caml_option.undefined_to_opt(props.innerRef)
  };
  var newProps = Object.assign({}, props, stylesObject);
  deleteProp(newProps, "innerRef");
  return React.createElement("div", newProps);
}

var Container = {
  deleteProp: deleteProp,
  getOrEmpty: getOrEmpty,
  styles: styles,
  make: make
};

var deleteProp$1 = ((newProps, key) => delete newProps[key]);

function getOrEmpty$1(str) {
  if (str !== undefined) {
    return " " + str;
  } else {
    return "";
  }
}

var styles$1 = CssJs.style([
      CssJs.label("Item"),
      CssJs.width({
            NAME: "percent",
            VAL: 100
          }),
      CssJs.height({
            NAME: "percent",
            VAL: 100
          }),
      CssJs.borderRadius({
            NAME: "pxFloat",
            VAL: 8
          }),
      CssJs.backgroundColor({
            NAME: "hex",
            VAL: "382a52"
          }),
      CssJs.color({
            NAME: "hex",
            VAL: "636077"
          }),
      CssJs.unsafe("border", "none"),
      CssJs.unsafe("cursor", "pointer")
    ]);

function make$1(props) {
  var className = styles$1 + getOrEmpty$1(Caml_option.undefined_to_opt(props.className));
  var stylesObject = {
    className: className,
    ref: Caml_option.undefined_to_opt(props.innerRef)
  };
  var newProps = Object.assign({}, props, stylesObject);
  deleteProp$1(newProps, "innerRef");
  return React.createElement("button", newProps);
}

var Item = {
  deleteProp: deleteProp$1,
  getOrEmpty: getOrEmpty$1,
  styles: styles$1,
  make: make$1
};

var deleteProp$2 = ((newProps, key) => delete newProps[key]);

function getOrEmpty$2(str) {
  if (str !== undefined) {
    return " " + str;
  } else {
    return "";
  }
}

var styles$2 = CssJs.style([
      CssJs.label("SelectedItem"),
      CssJs.width({
            NAME: "percent",
            VAL: 100
          }),
      CssJs.height({
            NAME: "percent",
            VAL: 100
          }),
      CssJs.borderRadius({
            NAME: "pxFloat",
            VAL: 8
          }),
      CssJs.backgroundColor({
            NAME: "hex",
            VAL: "382a52"
          }),
      CssJs.color({
            NAME: "hex",
            VAL: "dddbe3"
          }),
      CssJs.border({
            NAME: "pxFloat",
            VAL: 1
          }, "solid", {
            NAME: "hex",
            VAL: "636077"
          }),
      CssJs.unsafe("cursor", "pointer")
    ]);

function make$2(props) {
  var className = styles$2 + getOrEmpty$2(Caml_option.undefined_to_opt(props.className));
  var stylesObject = {
    className: className,
    ref: Caml_option.undefined_to_opt(props.innerRef)
  };
  var newProps = Object.assign({}, props, stylesObject);
  deleteProp$2(newProps, "innerRef");
  return React.createElement("button", newProps);
}

var SelectedItem = {
  deleteProp: deleteProp$2,
  getOrEmpty: getOrEmpty$2,
  styles: styles$2,
  make: make$2
};

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
  return React.createElement(make, {
              children: Belt_Array.map([
                    /* All */0,
                    /* TodoOnly */1,
                    /* DoneOnly */2
                  ], (function (v) {
                      var isSelected = value === v;
                      var onClick = function (param) {
                        Curry._1(onChange, v);
                      };
                      if (isSelected) {
                        return React.createElement(make$2, {
                                    children: makeLabel(v),
                                    key: stringify(v)
                                  });
                      } else {
                        return React.createElement(make$1, {
                                    children: makeLabel(v),
                                    key: stringify(v),
                                    onClick: onClick
                                  });
                      }
                    }))
            });
}

var make$3 = TodoFilter;

export {
  Container ,
  Item ,
  SelectedItem ,
  stringify ,
  makeLabel ,
  make$3 as make,
}
/* styles Not a pure module */
