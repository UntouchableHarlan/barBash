// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

// $('#biggestchange a').on('click', function(event){
// 	event.preventDefault();
// 	console.log('Clicked');
// 	console.dir(this);
// 	type = 'biggestchange';
// 	refreshDrinks();
// });

// console.log('attaching click');
// console.log($('#beers a'));
$('#tequilas a').on('click', function(event){
	event.preventDefault();
	// console.log('Clicked');
	// console.dir(this);
	type = 'Tequila';
	refreshDrinks();
});
$('#rums a').on('click', function(event){
	event.preventDefault();
	// console.log('Clicked');
	// console.dir(this);
	type = 'Rum';
	refreshDrinks();
});$('#vodkas a').on('click', function(event){
	event.preventDefault();
	// console.log('Clicked');
	// console.dir(this);
	type = 'Vodka';
	refreshDrinks();
});

$('#whiskeys a').on('click', function(event){
	event.preventDefault();
	// console.log('Clicked');
	// console.dir(this);
	type = 'Whiskey';
	refreshDrinks();
})
$('#craft_beers a').on('click', function(event){
	event.preventDefault();
	// console.log('Clicked');
	// console.dir(this);
	type = 'Wynwood Brewery';
	refreshDrinks();
});
$('#domestic_beer a').on('click', function(event){
	event.preventDefault();
	// console.log('Clicked');
	// console.dir(this);
	type = 'Domestic';
	refreshDrinks();
});
$('#imported_beer a').on('click', function(event){
	event.preventDefault();
	// console.log('Clicked');
	// console.dir(this);
	type = 'Imported';
	refreshDrinks();
});
$('#wines a').on('click', function(event){
	event.preventDefault();
	// console.log('Clicked');
	// console.dir(this);
	type = 'Wine';
	refreshDrinks();
});
$('#cocktails a').on('click', function(event){
	event.preventDefault();
	// console.log('Clicked');
	// console.dir(this);
	type = 'Cocktail';
	refreshDrinks();
});
