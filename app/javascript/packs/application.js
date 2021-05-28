// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.

// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

window.jQuery = $;
window.$ = $;

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require('./slick.min')

import "bootstrap"
import "jquery/dist/jquery.js"
import "popper.js/dist/popper.js"
import "bootstrap/dist/js/bootstrap"
import "./bootstrap_custom.js"
import '@fortawesome/fontawesome-free/js/all';

//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require activestorage
//= require_tree .
/*global $*/

$(function() {
  $('.slider').slick({
      dots: true,
      autoplay: true,
      autoplaySpeed: 4000,
      arrows: true,
  });
});