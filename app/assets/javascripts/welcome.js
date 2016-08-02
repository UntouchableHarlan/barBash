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
$('#arrow').addClass('animated bounce');







// Timer Button
$('#starttimer a').on('click', function(event) {
	event.preventDefault();
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
  min = parseInt(sec /60);
  seconds -= 1;
  $("#hour").html(format(min, sec));
	$('#stoptimer a').on('click', function(event) {
		event.preventDefault();
		clearInterval(interval)
		$("#hour").html('0:00')
	});

  if (seconds === -1){
    seconds = 60;
    refreshDrinks();
    // setInterval(interval).fadeOut(100).fadeIn(1000)
  }
}, 1000);
});
