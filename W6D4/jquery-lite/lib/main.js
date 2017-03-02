const DOMNodeCollection = require('dom_node_collection');

window.$l = (arg) => {
  if (arg.instanceof(HTMLElement)) {
    let html = Array.from(arg);
    html = new DOMNodeCollection(html);
    return html;
  } else {
    return document.querySelectorAll(arg);
  }
};
