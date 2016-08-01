// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(window).scroll(function() {
	// console.log("some")
    if ($(".navbar").offset().top > 50) {
			console.log("thing");
        $('.navbar-custom').addClass('affix');
        $(".navbar-fixed-top").addClass("top-nav-collapse");
    } else {
			console.log("else");
        $('nav.navbar-custom').removeClass('affix');
        $("nav.navbar-fixed-top").removeClass("top-nav-collapse");
    }
});

var seconds = 60;
var type = "";
// Seconds format
function format(min, sec) {
	if (sec === 0){
		return min + ":" + "00"

	} else if(sec < 10){
		return (min + ":0" + sec).fontcolor("red")
	}
	else {
		return min + ":" + sec
	}
}
// Timer
var interval = setInterval(function() {
	var min = parseInt(seconds/60);
	var sec = (seconds % 60);
  min = parseInt(sec /60)
  seconds -= 1
  $("#hour").html(format(min, sec));
  if (seconds === -1){
    seconds = 60;
    refreshDrinks();
    // setInterval(interval).fadeOut(100).fadeIn(1000)
  }
}, 1000);

// Refreshes the prices
function refreshDrinks() {
	$('.modal').remove();
  $('.table').load("/?type=" + type + " #beer").fadeOut(1000).fadeIn(1000);
}
