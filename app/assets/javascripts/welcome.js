// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
var type = "";
function ready() {
	$('#biggestchange a').on('click', function(event){
		event.preventDefault();
		// console.log('Clicked');
		// console.dir(this);
		type = 'biggestchange';
		refreshDrinks();
	});
	$('#shot a').on('click', function(event){
		event.preventDefault();
		// console.log('Clicked');
		// console.dir(this);
		type = 'shot';
		refreshDrinks();
	});
	$('#beerss a').on('click', function(event){
		event.preventDefault();
		// console.log('Clicked');
		// console.dir(this);
		type = 'beer';
		refreshDrinks();
	});
	$('#wine a').on('click', function(event){
		event.preventDefault();
		// console.log('Clicked');
		// console.dir(this);
		type = 'wine';
		refreshDrinks();
	});

	$('#cocktail a').on('click', function(event){
		event.preventDefault();
		// console.log('Clicked');
		// console.dir(this);
		type = 'cocktail';
		refreshDrinks();

	});

	var handler = StripeCheckout.configure({
		key: 'pk_test_62HeHVyg9ixt0DZ2WE0UdVZ1',
		locale: 'auto',
		token: function(token) {
			// You can access the token ID with `token.id`.
			// Get the token ID to your server-side code for use.

			$.ajax({
				url: '/sale',
				data: {name: name, price: price},
				success: function(){
					console.log('success!');
				}
			});
		}
	});

	$('body').on('click','.customButton', function(e) {
		// console.log('clicked');
		e.preventDefault();
		var table = $(this).parent().parent().children(), holding = [];

		table.each(function(i){
			holding.push($(this));
		});

		name = holding[0].text(), bio = holding[1].text(), price = holding[2].first().children().first().text();
		// Open Checkout with further options:
		handler.open({
			name: name,
			description: bio,
			amount: parseFloat(price) * 100
		});
	});
	$('body').on('click', '#submitButton', function(e){
		// e.preventDefault();

	});

	$('#arrow').addClass('animated bounce');
	$('.starttimer').on('click', function(event) {
	  console.log("This is happneing?")
	  	event.preventDefault();
	  var seconds = 10;
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
	var interval = setInterval(function() {
		var min = parseInt(seconds/60);
		var sec = (seconds % 60);

	  seconds -= 1;
	  $("#hour").html(format(min, sec));
		$('#stoptimer a').on('click', function(event) {
			event.preventDefault();
			clearInterval(interval)
			$("#hour").html('0:00')
		});
	  if (seconds === -1){
	    seconds = 10;
			$.ajax({
	      url: '/updateprices',
	      success: function(){
	        console.log('success!');
	      }
			});
	    refreshDrinks();
	    // setInterval(interval).fadeOut(100).fadeIn(1000)
	  }
	}, 1000);
	});
	function refreshDrinks() {
		// $('.modal').remove();
	  $('.table').load("/?type=" + type + " .table").fadeOut(1000).fadeIn(1000);

	}
}

$(document).on('ready turbolinks:load', ready);



// Timer Button
