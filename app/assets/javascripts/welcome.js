// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

// console.log('attaching click');
// console.log($('#beers a'));
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
	}
});

$('body').on('click','.customButton', function(e) {
	e.preventDefault();
	var table = $(this).parent().parent().children(), holding = [];

	table.each(function(i){
		holding.push($(this).text());
			// console.log($(this).text());
	});
	// console.log($(this).parent().parent().children());
	var name = holding[0], bio = holding[1], price = holding[2];
	// Open Checkout with further options:
	handler.open({
		name: name,
		description: bio,
		amount: parseInt(price) * 100
	});
});





$('#arrow').addClass('animated bounce');

// Timer Button
// $('#starttimer a').on('click', function(event) {
// 	event.preventDefault();
// 	var seconds = 60;
// 	var type = "";
// 	// Seconds format
// 	function format(min, sec) {
// 		if (sec === 0){
// 			return min + ":" + "00"
//
// 		} else if(sec < 10){
// 			return (min + ":0" + sec).fontcolor("red")
// 		}
// 		else {
// 			return min + ":" + sec
// 		}
// 	}
// 	// Timer
// 	var interval = setInterval(function() {
// 		var min = parseInt(seconds/60);
// 		var sec = (seconds % 60);
// 		min = parseInt(sec /60);
// 		seconds -= 1;
// 		$("#hour").html(format(min, sec));
// 		$('#stoptimer a').on('click', function(event) {
// 			event.preventDefault();
// 			clearInterval(interval)
// 			$("#hour").html('0:00')
// 		});
//
// 		if (seconds === -1){
// 			seconds = 60;
// 			refreshDrinks();
// 			// setInterval(interval).fadeOut(100).fadeIn(1000)
// 		}
// 	}, 1000);
