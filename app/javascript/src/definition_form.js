// Programmatically add a text because simple-form's template is hard to customize.
function addHelpTextToTagsInput() {
  var helpTextClassname = 'js-DefinitionForm-tagNamesHelpText';
  var tagNameInputParent = document.querySelector('.form-group.definition_tag_names');

  if (!tagNameInputParent) {
    return;
  }

  if (tagNameInputParent.getElementsByClassName(helpTextClassname).length > 0) {
    return;
  }

  // Create a new element for a help text
  var helpTextEl = document.createElement('small');
  helpTextEl.classList.add('form-text');
  helpTextEl.classList.add('text-muted');
  helpTextEl.classList.add(helpTextClassname);
  helpTextEl.textContent = 'Comma separated';

  // Append that el to the "tags" field
  if (tagNameInputParent) {
    tagNameInputParent.appendChild(helpTextEl);
  }
}

// Expose references to window.MyApp
window.MyApp.DefinitionForm = {
  addHelpTextToTagsInput: addHelpTextToTagsInput,
};
