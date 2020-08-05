/*
  Script to display the viewport size when working on responsive stuff.
  Adpted to vanilla JS by: Taylor Hunt - https://codepen.io/tigt/
*/

var el = document.createElement("output");

document.body.append(el);

Object.assign(el.style, {
  position: "fixed",
  bottom: 0,
  left: 0,
  background: "red",
  color: "white",
  padding: "5px",
  fontSize: "11px",
  opacity: 0.7
});

function updateOutput() {
  var html = document.documentElement;
  el.value = html.clientWidth + " × " + html.clientHeight;
}

window.addEventListener("resize", updateOutput);

updateOutput();
