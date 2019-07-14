// Submit WordSearch when a word is selected from the select options.
document.addEventListener('turbolinks:load', function(e) {
  var wordOptionsEl = document.querySelector('.js-WordSearch-searchBar-input');
  if (wordOptionsEl) {
    wordOptionsEl.addEventListener('input', onInput);
  }

  // https://stackoverflow.com/questions/30022728/perform-action-when-clicking-html5-datalist-option
  function onInput(e) {
    var input = e.target;
    var val = input.value;
    var list = input.getAttribute('list');
    var options = document.getElementById(list).childNodes;
    var submit = document.querySelector('.js-WordSearch-submit');

    for (var i = 0; i < options.length; i++) {
      if (options[i].innerText === val) {
        submit.click();
        // console.log('word option item selected: ', val);
        break;
      }
    }
  }
});

// Submit WordSearch when a tag is selected from the select options.
document.addEventListener('turbolinks:load', function(e) {
  var tagFilterSelectEl = document.querySelector('.js-WordSearch-tagFilter-select');
  if (tagFilterSelectEl) {
    tagFilterSelectEl.addEventListener('change', onChange);
  }

  function onChange() {
    var submit = document.querySelector('.js-WordSearch-submit');
    submit.click();
  }
});
