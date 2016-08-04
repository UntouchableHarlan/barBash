// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

var type = "";
function ready() {
	// homepage
	$('#biggestchange a').on('click', function(event){
		event.preventDefault();
		// type = 'biggestchange';
		$('.shots_container').css("display", "none");
		$('.beer_container').css("display", "none");
		$('.cocktail_container').css("display", "none");
		$('.best_deal_container').css("display", "flex");
	});

	$('#shot a').on('click', function(event){
		event.preventDefault();
		// type = 'shot';
		$('.shots_container').css("display", "flex");
		$('.beer_container').css("display", "none");
		$('.cocktail_container').css("display", "none");
		$('.best_deal_container').css("display", "none");
	});

	$('#beerss a').on('click', function(event){
		event.preventDefault();
		$('.shots_container').css("display", "none");
		$('.beer_container').css("display", "flex");
		$('.cocktail_container').css("display", "none");
		$('.best_deal_container').css("display", "none");

		// type = 'beer';
	});

	$('#cocktail a').on('click', function(event){
		event.preventDefault();
		$('.shots_container').css("display", "none");
		$('.beer_container').css("display", "none");
		$('.cocktail_container').css("display", "block");
		$('.best_deal_container').css("display", "none");
		// type = 'cocktail';
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
					console.log('welcome.js!');
				}
			});
		}
	});

	$('body').on('click','.customButton', function(e) {
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
			if (seconds === 5){
				// clearInterval(interval)
				$.ajax({
					url: '/updateprices',
					success: function(){
						console.log('success!');
						$('#hour').fadeOut(5000);
						$('.tables_container').fadeOut(5000);
						$('.tables_container').load("/ .tables_container")
						// sleep(5000)
						$('.tables_container').fadeIn(1000);
						$('#hour').fadeIn(300, function(){
							seconds = 300;
						});
						// setInterval(interval)
					}
				});
			}
		}, 1000);
	});

	$('#graph').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget);
		var data = button.data('data');
		var name = button.data('name');
		new Chartkick.LineChart("chart", data, {});
		$('.modal-title').text(name);
	});
}

$(document).on('ready turbolinks:load', ready);



// Timer Button
