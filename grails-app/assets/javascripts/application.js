// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require googleMaps
//= require jquery
//= require bootstrap
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
	(function($) {
		$(document).ajaxStart(function(){
			$('#spinner').fadeIn();
		}).ajaxStop(function(){
			$('#spinner').fadeOut();
		});
	})(jQuery);
}

$( document ).ready(function () {
	$("#pass_not_equal_div").hide();
	$("#pass").keyup(function() {
		if ($("#confirm_pass").val() != $(this).val()) {
			$("#pass_not_equal_div").show();
			$("#register_btn").prop("disabled",true);
		} else {
			$("#pass_not_equal_div").hide();
		}
	});
	$("#confirm_pass").keyup(function() {
		if ($("#pass").val() != $(this).val()) {
			$("#pass_not_equal_div").show();
			$("#register_btn").prop("disabled",true);
		} else {
			$("#pass_not_equal_div").hide();
		}
	});

	$(".img-description").css({'line-height': $(".img-wrapper").height() + "px"});
});

