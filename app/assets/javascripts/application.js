// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
    
    function clearError(category) {
      var errors = $('.error');
      for (var i = 0; i < errors.length; i++) {
        errors[i].parentNode.removeChild(errors[i]);
      }
      
      var hasError = $('.has-error');
      for (var i = 0; i < hasError.length; i++) {
        hasError[i].className="form-group";
      }
    }
    
    function appendTip(data, category, position) {
      clearError(category);
      if(position == "bottom"){
        $('.'+category).append(data);
        var new_tip_panel = $(".tip_panel", $('.'+category)).last();
      } else if(position == "top") {
        $('.'+category).prepend(data);
        var new_tip_panel = $(".tip_panel", $('.'+category)).first();
      }
      bind_score_events(new_tip_panel);
      $('.form-'+category+'-description').val("");
    }
    
    function markError(errors, category) {
      clearError(category);
      for (var error in errors) {
        var parent = $('.form-'+category+'-'+error).parent();
        if (!parent.hasClass("has-error")) {
          parent.toggleClass('has-error');
        }
        for (var elem in errors[error]) {
          parent.append('<p class="error">'+errors[error][elem]+'</p>')
        }
      }
    }
    
    $('.tip_form').on('ajax:success', function(e, data, status, xhr){
      var category = $(this).attr('id').replace('form-', '');
      var form_element = $(this).closest('.tip_form');
      if(form_element.hasClass('top-tip-form')){
        appendTip(data, category, "top");
      }else if (form_element.hasClass('bottom-tip-form')){
        appendTip(data, category, "bottom");
      }
      
    }).on('ajax:error',function(e, xhr, status, error){
      var category = $(this).attr('id').replace('form-', '');
      markError(xhr.responseJSON, category);
    });
    
    
    function toggle_color(vote_button){
      if(vote_button.hasClass('upvote_tip')){
        vote_button.toggleClass('btn-default');
        vote_button.toggleClass('btn-success');
      } else if(vote_button.hasClass('downvote_tip')){
        vote_button.toggleClass('btn-default');
        vote_button.toggleClass('btn-danger');
      }
    }
    
    function update_score_value(score, bonus){
      score.text(parseInt(score.text()) + bonus);
    }
    
    function update_score(tip, bonus){
      var score = tip.find('.tip_score');
      var positive_score = tip.find('.tip_positive_score');
      var negative_score = tip.find('.tip_negative_score');
      var upvote_button = tip.find('.upvote_tip');
      var downvote_button = tip.find('.downvote_tip');
      
      if(tip.hasClass("is_not_voted")){
        update_score_value(score, bonus);
        if(bonus > 0){
          update_score_value(positive_score, bonus);
          toggle_color(upvote_button);
        } else {
          update_score_value(negative_score, -1 * bonus);
          toggle_color(downvote_button);
        }
        tip.removeClass("is_not_voted");
        tip.addClass("is_voted");
        
      } else if(tip.hasClass("is_voted")){
        
        //If the vote is different from the current vote
        if(upvote_button.hasClass("btn-success") && bonus < 0 || downvote_button.hasClass('btn-danger') && bonus > 0){
          update_score_value(score, 2 * bonus);
          update_score_value(positive_score, bonus);
          update_score_value(negative_score, -1 * bonus);
          toggle_color(upvote_button);
          toggle_color(downvote_button);
          
        //If the vote is the same as the current vote
        } else {
          tip.addClass("is_not_voted");
          tip.removeClass("is_voted");
          update_score_value(score, -1 * bonus);
          if(bonus > 0){
            toggle_color(upvote_button);
            update_score_value(positive_score, -1 * bonus);
          } else if(bonus < 0){
            toggle_color(downvote_button);
            update_score_value(negative_score, bonus);
          }
        }
      }
    }
    
    function bind_score_events(elements){
      elements.find('.upvote_tip').on('click', function() {
        var tip_panel = $(this).closest('.tip_panel');
        update_score(tip_panel, 1);
        event.preventDefault(); // Prevent link from following its href
      });
      
      elements.find('.downvote_tip').on('click', function() {
        var tip_panel = $(this).closest('.tip_panel');
        update_score(tip_panel, -1);
        event.preventDefault(); // Prevent link from following its href
      });
    }
    
    bind_score_events($('.tip_panel'));
    
    
      $('.hex').hover(
        function(){
          var img = $(this).children().children().first();
          img.css('opacity', '0.5');
        }, 
        function() {
          var img = $(this).children().children().first();
          img.css('opacity', '1');
        }
      );
    
});