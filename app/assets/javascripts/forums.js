var simplemde;

simplemde = null;

$(document).on('turbolinks:before-visit', function() {
  if (simplemde != null) {
    simplemde.toTextArea();
    return simplemde = null;
  }
});

$(document).on('turbolinks:load', function() {
  return simplemde = new SimpleMDE({
    element: $("#textarea2")[0],
    showIcons: ["code", "table"]
  });
});
