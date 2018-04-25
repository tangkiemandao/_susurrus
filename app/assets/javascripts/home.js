jQuery(function(){
	jQuery('#camera_wrap_2').camera({
		loader: 'bar',
		speed: 1000,
		pagination: false,
		thumbnails: false,
	});

	jQuery('.counter').counterUp({
		delay: 10,
		time: 1000
	});

	(function() {
		[].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
			new CBPFWTabs( el );
		});
	})();

  // Swipe-Box-JavaScript
	jQuery(function($) {
		$(".swipebox").swipebox();
	});

  //  Smooth-Scrolling-JavaScript
	jQuery(document).ready(function($) {
		$(".scroll, .navbar li a, .footer li a").click(function(event){
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
  });
});
