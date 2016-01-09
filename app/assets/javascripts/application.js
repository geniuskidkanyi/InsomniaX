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
//= require bootstrap-sprockets
//= require affix
//= require alert
//= require button
//= require carousel
//= require collapse
//= require dropdown
//= require tab
//= require transition
//= require scrollspy
//= require modal
//= require tooltip
//= require popover
//= require forem
//= require jquery.turbolinks
//= require chosen-jquery
//= require messages
//= require comments

//= require bootstrap
$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();
});
$(document).ready(function () {
    var $btnSets = $('#responsive'),
        $btnLinks = $btnSets.find('a');

    $btnLinks.click(function (e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.user-menu>div.user-menu-content").removeClass("active");
        $("div.user-menu>div.user-menu-content").eq(index).addClass("active");
    });
});

$(document).ready(function () {
    $("[rel='tooltip']").tooltip();

    $('.view').hover(
        function () {
            $(this).find('.caption').slideDown(250); //.fadeIn(250)
        },
        function () {
            $(this).find('.caption').slideUp(250); //.fadeOut(205)
        }
    );
});

var supports = (function () {
    var d = document.documentElement,
        c = "ontouchstart" in window || navigator.msMaxTouchPoints;
    if (c) {
        d.className += " touch";
        return {
            touch: true
        }
    } else {
        d.className += " no-touch";
        return {
            touch: false
        }
    }
})();

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
