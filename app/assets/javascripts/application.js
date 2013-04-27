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
//= require bootstrap
//= require jquery_ujs
//= require jquery.ui.all
//= require jquery_nested_form
//= require_tree .

$(document).ready(function() {
	$("img.lazy").lazyload();
  $("textarea").autosize();
	
	 $(".comment-area").hide();
	// $(".commit_submit").click(function(){
	//    $(".comment").toggle();
	//  });
	$(".new_comment").bind('ajax:success',function(evt, data, status, xhr){
			var data_id = $(this).find('input[type=submit]').data("id");
			console.log("success");
			$("."+data_id).children(".new_comment").before(data).fadeIn("slow");
			$(".new_comment_text_area").val("");	
		}).bind("ajax:error",function() {

	});

	$(".comment-area").delegate("a", "click",'ajax:success',function(evt, data, status, xhr){
			$(this).parent().parent().fadeOut();
		}).bind("ajax:error",function() {
	});

	$(".like_post").bind('ajax:success',function(evt, data, status, xhr){
			$(this).parent().parent().fadeOut();
		}).bind("ajax:error",function() {
			
	});


	$(".poll_form").bind('ajax:success',function(evt, data, status, xhr){
			$(this).parent().fadeOut();
		}).bind("ajax:error",function() {
			
	});
	
  $('a.comment_button').click(function(){
  		var data_id = $(this).data('id');
	    $(this).parent().siblings('.comment-area-'+data_id).toggle("slow");
	  });
  
})

