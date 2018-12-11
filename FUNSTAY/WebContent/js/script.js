( function( $ ) {
$( document ).ready(function() {
// Cache the elements we'll need
$('#sect_HJ').children('li').click(function(){
	$(this).css('color','#fc4401');
})	;
var menu = $('#listmenu_shj');
var menuList = menu.find('ul:first');
var listItems = menu.find('li').not('#responsive-tab');

// Create responsive trigger
menuList.prepend('<li id="responsive-tab"><a href="#">Menu</a></li>');

// Toggle menu visibility
menu.on('click', '#responsive-tab', function(){
	listItems.slideToggle('fast');
	listItems.addClass('collapsed');
	
});
});
} )( jQuery );
