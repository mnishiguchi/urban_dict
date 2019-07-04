// Expose references to window
window.MyApp = window.MyApp || {};
// window.$ = require('jquery');
window.iziToast = require('izitoast/dist/js/iziToast');

// Invoke third-party js in node_modules
require('bootstrap/dist/js/bootstrap.bundle.js');

// Invoke custom js
require('./definition_form.js');
