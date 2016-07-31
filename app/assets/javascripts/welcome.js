// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


// $(document).ready(function() {
//     $('.btn-success').click(function() {
//       $('.modal').fadeIn(1000)
//     })


// $('#biggestchange a').on('click', function(event){
// 	event.preventDefault();
// 	console.log('Clicked');
// 	console.dir(this);
// 	type = 'biggestchange';
// 	refreshDrinks();
// });


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
//
// $('#craft_beers a').on('click', function(event){
//
// 	event.preventDefault();
// 	// console.log('Clicked');
// 	// console.dir(this);
// 	type = 'Wynwood Brewery';
// 	refreshDrinks();
// });
// $('#domestic_beer a').on('click', function(event){
// 	event.preventDefault();
// 	// console.log('Clicked');
// 	// console.dir(this);
// 	type = 'Domestic';
// 	refreshDrinks();
// });
// $('#imported_beer a').on('click', function(event){
// 	event.preventDefault();
// 	// console.log('Clicked');
// 	// console.dir(this);
// 	type = 'Imported';
// 	refreshDrinks();
// });
// $('#wines a').on('click', function(event){
// 	event.preventDefault();
// 	// console.log('Clicked');
// 	// console.dir(this);
// 	type = 'Wine';
// 	refreshDrinks();
// });
// $('#cocktails a').on('click', function(event){
// 	event.preventDefault();
// 	// console.log('Clicked');
// 	// console.dir(this);
// 	type = 'Cocktail';
// 	refreshDrinks();
// });
