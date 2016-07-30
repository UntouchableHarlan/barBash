// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


console.log('attaching click');
console.log($('#beers a'));
$('#beers a').on('click', function(event){
	event.preventDefault();
	console.log('Clicked');
	console.dir(this);
	type = 'beer';
	refreshDrinks();
});
$('#wines a').on('click', function(event){
	event.preventDefault();
	console.log('Clicked');
	console.dir(this);
	type = 'wine';
	refreshDrinks();
});$('#vodkas a').on('click', function(event){
	event.preventDefault();
	console.log('Clicked');
	console.dir(this);
	type = 'vodka';
	refreshDrinks();
});