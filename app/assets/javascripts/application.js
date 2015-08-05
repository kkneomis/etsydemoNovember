// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//s
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap.min
//= require jquery.countTo
//= require jquery.waypoints.min
//= require lightbox.min
//= require scripts
//= require_tree .

$(document).on("page:change", function() {
     $(".navbar .dropdown").hover((function() {
         $(this).find(".dropdown-menu").first().stop(true,
true).delay(150).slideDown();
    }), function() {
         $(this).find(".dropdown-menu").first().stop(true,
true).delay(50).slideUp();
    });
  });

