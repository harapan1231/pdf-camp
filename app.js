function App(props) {
  return (
    h("div", {class: "container"}, [
      h("label", [
        h("input", {type: "number"}),
          h("span", "Text")
        ]),
      h("button", {class: "button"},  "Click")]
    )
  );
}

Inferno.render(Inferno.createElement(App), document.getElementById("app"));
