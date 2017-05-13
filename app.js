var app = {};

app.view = 
    h("div", {class: "container"}, [
        h("label", [
            h("input", {type: "number"}),
            h("span", "Text")
        ]),
        h("button", {class: "button"},  "Click")]
    );

Inferno.render(app.view, document.getElementById("app"));
