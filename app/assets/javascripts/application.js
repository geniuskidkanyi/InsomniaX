// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require materialize-sprockets
//= require materialize
//= require forem
//= require linkify
//= require linkify-jquery
//= require sticky
//= require jquery.turbolinks
//= require chosen-jquery
//= require messages
//= require comments
//= require ckeditor/init
//= require soulmate
//= require search
//= require social-share-button
//= require google_analytics
//= require user
$(document).ready(function(){
      $('.parallax').parallax();
    });

$(document).on('ready turbolinks:load', function () {
    $('ul.tabs').tabs('select_tab', '#test1');

    $('input#input_text, textarea#textarea1').characterCounter();
$('p').linkify();

    $(".button-collapse").sideNav();
    // $('.parallax').parallax();
    $('.materialboxed').materialbox();

    $(".dropdown-button").dropdown();
    $('.modal-trigger').leanModal();
    $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  });
});

$(document).on('ready turbolinks:load', function () {
    $('ul.tabs').tabs('select_tab', '#test1');
});
