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

// setInterval(function() {
//    var day = new Date();
//    var time = day.toLocaleTimeString();
//    document.getElementById("hour").innerHTML = time;
//  }, 1000);



// $(document).ready(function(){
//   $("button").on("click", function() {
//     $('.table').fadeOut(100).load("/ .table").fadeIn(1000)
//     // $(".table")
//   })
// });


var seconds= 10;
var interval = setInterval(function() {
  min = parseInt(seconds/60);
  sec = (seconds % 60)
	 format = function(min, sec){
		if (sec === 0){
			return min + ":" + "00"

		} else if(sec < 10){
				return min + ":0" + sec
		}
			else {
				return min + ":" + sec
			}


	}
  // min = parseInt(sec /60)
  seconds -= 1
   document.getElementById("hour").innerHTML = format(min, sec);
   if (seconds === -1){
      seconds = 10;
    // $('.table').fadeOut(100).load("/ .reload").fadeIn(1000);
     setInterval(interval).fadeOut(100).fadeIn(1000)
 }
 }, 1000);
