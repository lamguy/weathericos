// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require twitter/bootstrap
//= require masonry
//= require home
//= require downloads
//= require registrations
//= require items
//= require payment_notifications

$(document).ready(function() {

	var container = document.querySelector('.icons');
	var msnry = new Masonry( container, {
	  // options
	  columnWidth: 106,
	  itemSelector: '.icongrid'
	});
});
