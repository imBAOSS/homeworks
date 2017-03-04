import React from "react";
import ReactDOM from "react-dom";
import Main from "./main";
import Tab from "./frontend/tabs";

let tabdata = [
  {title: "one", content: "This is ONE"},
  {title: "two", content: "This is TWO"},
  {title: "threee", content: "This is THREE"}
];

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<Tab tabdata={tabdata}/>, root);
});
