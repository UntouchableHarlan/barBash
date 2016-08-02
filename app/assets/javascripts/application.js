


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
//= require_tree .
//= require Chart.bundle
//= require chartkick

$(document).ready(function() {
  $.fn.fullpage({
    menu: '.navbar',
    verticalCentered: true,
    resize : false,
    anchors:['firstPage', 'secondPage', 'thirdPage', 'fourthPage'],
    navigation: true,
    navigationPosition: 'right',
    navigationTooltips:['firstPageTooltip', 'secondPageTooltip', 'thirdPageTooltip', 'fourthPageTooltip'],
    css3: true
  });
});

// Nav Bar Customization
$(window).scroll(function() {
  var navbar = $('.navbar-custom');
  var affixed = navbar.hasClass('affix');
  var top = $(".navbar").offset().top;

  if (top > 50 && !affixed) {
		// console.log("thing");
    navbar.addClass('affix');
    $(".navbar-fixed-top").addClass("top-nav-collapse");
  } else if (top < 50 && affixed) {
		// console.log("else");
    navbar.removeClass('affix');
    $("nav.navbar-fixed-top").removeClass("top-nav-collapse");
  }
    if ($(".navbar").offset().top > 50) {
        $('.navbar-custom').addClass('affix');
        $(".navbar-fixed-top").addClass("top-nav-collapse");
    } else {
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
// console.log('starting a new interval');
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
}, 2000);


// Refreshes the prices
function refreshDrinks() {
	// $('.modal').remove();
  $('.table').load("/?type=" + type + " .table").fadeOut(1000).fadeIn(1000);
}

// Stripe payment
$(function() {
  var $form = $('#payment-form');
  $form.submit(function(event) {
    // Disable the submit button to prevent repeated clicks:
    $form.find('.submit').prop('disabled', true);

    // Request a token from Stripe:
    Stripe.card.createToken($form, stripeResponseHandler);

    // Prevent the form from being submitted:
    return false;
  });
});


// Sending stripe payment
function stripeResponseHandler(status, response) {
  // Grab the form:
  var $form = $('#payment-form');

  if (response.error) { // Problem!

    // Show the errors on the form:
    $form.find('.payment-errors').text(response.error.message);
    $form.find('.submit').prop('disabled', false); // Re-enable submission

  } else { // Token was created!

    // Get the token ID:
    var token = response.id;

    // Insert the token ID into the form so it gets submitted to the server:
    $form.append($('<input type="hidden" name="stripeToken">').val(token));

    // Submit the form:
    $form.get(0).submit();
  }
};
