/**
 * A function to show the viewport size at all times.
 * Made for development purpose only, please disable script before puplication.
 * The small red rectangle inte the lower left corner holds your
 * webbbrowsers viewport size dimensions.
 */

"use strict";

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
