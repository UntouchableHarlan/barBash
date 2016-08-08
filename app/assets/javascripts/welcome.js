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
		event.preventDefault();

		var seconds = $('.grab_time').val();
		$.ajax({
			url: '/addtimer',
			data: {timer: seconds},
			success: function(){
				console.log('timer added')
			}
		});
		var interval = setInterval(function() {
			var min = parseInt(seconds/60);
			var sec = (seconds % 60);
			seconds -= 1;
			if (seconds <= 0){
			seconds = 0
			}
			$("#hour").html(format(min, sec));
			if (seconds === 7){
				$.ajax({
					url: '/addsales',
					success: function(){
						console.log('sales added');
					}
				});
			}
			if (seconds === 4){
				// clearInterval(interval)
				$.ajax({
					url: '/updateprices',
					success: function(){
						console.log('success!');
						$('.tables_container').fadeOut(4000);
						$('.tables_container').load("/ .tables_container")
						$('.tables_container').fadeIn(1000, function(){
							$('.sales_info').load("/ .sales_info", function(){
								console.log("sales info update")
							})
								seconds = $('.grab_time').val();
						});
						// setInterval(interval)
					}
				});

			}
			$('#stoptimer').on('click', function(event) {
				event.preventDefault();
				clearInterval(interval)
				$("#hour").html('0:00')
			});
		}, 1000);
	});

	$('#graph').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget);
		var data = button.data('data');
		var name = button.data('name');
		new Chartkick.LineChart("chart", data, {});
		$('.modal-title').text(name);
	});
	function format(min, sec) {
		if (sec === 0){
			return min + ":" + "00"
		}	else if(min === 0 && sec < 10){
					return((min + ":0" + sec).fontcolor("red"))
		} else if(sec < 10){
			return (min + ":0" + sec)
		}
		else {
			return min + ":" + sec
		}
	}
	$('.marketcrash').on('click', function(){
		$.ajax({
			url: '/marketcrash',
			success: function(){
				console.log('Market Crashed');
				$('.tables_container').fadeOut(500);
				$('.tables_container').load('/ .tables_container', function(){
					$('.tables_container').fadeIn(500);
					$('.market_crash').append('<h1>The Market Just Crahsed All Drink Are Rock Bottom!</h1>');
				});
			}
		});
	});

}

$(document).on('ready turbolinks:load', ready);



// Timer Button
