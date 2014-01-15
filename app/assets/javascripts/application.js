// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//

//= require jquery
//= require jquery_ujs


//= require messenger
//= require flasher.js

//= require share42.js
//= require jquery.easing.1.3.js
//= require comments.js.coffee
//= require users.js
/*
 
 require_tree .
*/


$(function() {
  flasherFeature.init();
});
/*
USING -> on element attribute:
onclick="toggle(event, 'tohide');"

// click on the div
function toggle( e, id ) {
  var el = document.getElementById(id);
  el.style.display = ( el.style.display == 'none' ) ? 'none' : 'none';

  // save it for hiding
  toggle.el = el;

  // stop the event right here
  if ( e.stopPropagation )
    e.stopPropagation();
  e.cancelBubble = true;
  return false;
}

// click outside the div
document.onclick = function() {
  if ( toggle.el ) {
    toggle.el.style.display = 'none';
  }
}
*/


$(document).ready(function(){
    /* This code is executed after the DOM has been completely loaded */

    /* Changing thedefault easing effect - will affect the slideUp/slideDown methods: */
    $.easing.def = "easeOutBounce";

    /* Binding a click event handler to the links: */
    $('a.list-group-item').click(function(e){

        /* Finding the drop down list that corresponds to the current section: */
        var dropDown = $(this).next();

        /* Closing all other drop down sections, except the current one */
        $('.categoryupdown').not(dropDown).slideUp('slow');
        dropDown.slideToggle('slow');

        /* Preventing the default event (which would be to navigate the browser to the link's address) */
        e.preventDefault();
    })

};
