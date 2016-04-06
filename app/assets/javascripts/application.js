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
//= require jquery.turbolinks
//= require chosen-jquery
//= require messages
//= require comments
//= require ckeditor/init
//= require jquery.soulmate
//= require search
//= require google_analytics
//= require user
//= require sticky

$(document).on('ready page:load', function () {
  $('#sidebar').Stickyfill();
    $(".button-collapse").sideNav();
    $('.parallax').parallax();
    $('.materialboxed').materialbox();
    $('ul.tabs').tabs('select_tab', '#test1');
    $(".dropdown-button").dropdown();
    $('.modal-trigger').leanModal();
    $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  });


});


$('.vote')
    .on('ajax:send', function () {
        $(this).addClass('loading');
    })
    .on('ajax:complete', function () {
        $(this).removeClass('loading');
    })
    .on('ajax:error', function () {
        $(this).after('<div class="error">There was an issue.</div>');
    })
    .on('ajax:success', function (data) {
        $(this).html(data.count);
    });
$('.navbar .dropdown').hover(function () {
    $(this).find('.dropdown-menu').first().stop(true, true).slideDown(150);
}, function () {
    $(this).find('.dropdown-menu').first().stop(true, true).slideUp(105)
});

var sidebar = document.getElementById('sidebar');
Stickyfill.add(sidebar);
