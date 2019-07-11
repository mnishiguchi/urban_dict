document.addEventListener('turbolinks:load', function(e) {
  var wordOptionsEl = document.querySelector('input[list="WordSearch-wordOptions"]');
  if (wordOptionsEl) {
    wordOptionsEl.addEventListener('input', onInput);
  }

  // https://stackoverflow.com/questions/30022728/perform-action-when-clicking-html5-datalist-option
  function onInput(e) {
    var input = e.target;
    var val = input.value;
    var list = input.getAttribute('list');
    var options = document.getElementById(list).childNodes;

    for (var i = 0; i < options.length; i++) {
      if (options[i].innerText === val) {
        Turbolinks.visit('/words?q=' + val, { action: 'replace' });

        // An item was selected from the list!
        console.log('word option item selected: ', val);
        break;
      }
    }
  }
});
