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
    
  //Clears errors on tip form
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
  
  //mark the errors of the tip form
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
  
  //Bind events on tip form
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
  
  
  //append a tip to a category
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
    bind_edit_events(new_tip_panel.find('.tip_edit'));
    $('.form-'+category+'-description').val("");
  }
  
  //toggle the color of a voting button
  function toggle_color(vote_button){
    if(vote_button.hasClass('upvote_tip')){
      vote_button.toggleClass('btn-default');
      vote_button.toggleClass('btn-success');
    } else if(vote_button.hasClass('downvote_tip')){
      vote_button.toggleClass('btn-default');
      vote_button.toggleClass('btn-danger');
    }
  }
  
  //update a score by a bonus
  function update_score_value(score, bonus){
    score.text(parseInt(score.text()) + bonus);
  }
  
  //udapte all tip's scores by a bonus
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
  
  //binds events on tip's voting buttons
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
  //actual binding of events on all tip's voting buttons
  bind_score_events($('.tip_panel'));
  
  //binds events on tip's edit button
  function bind_edit_events(elements){
    elements.on('click', function(){
      var edit_button = $(this);
      console.log(edit_button);
    });
  }
  //actual binding of events on all tip's edit buttons
  bind_edit_events($('.tip_edit'));
  
  
  //makes a hexagonal cel darker by hovering it
  $('.hex').hover(
    function(){
      var img = $(this).children().children().first();
      img.css('filter', 'brigthness(50%)');
      img.css('-moz-filter', 'brigthness(50%)');
      img.css('-webkit-filter', 'brightness(50%)');
    }, 
    function() {
      var img = $(this).children().children().first();
      img.css('filter', 'brigthness(100%)');
      img.css('-moz-filter', 'brigthness(100%)');
      img.css('-webkit-filter', 'brightness(100%)');
    }
  );
  
  //TODO comment
  function bind_dropdown_link(){
    console.log("dropdowned!");
  };
  
  //bind events on dropdown-links
  $('.dropdown-link').on('click', function bind_dropdown_link(){
    var dropdown_title = $(this);
    var dropdown_content = dropdown_title.next(".dropdown-content");
    dropdown_content.toggleClass("hidden");
    
    var caret = dropdown_title.find("i.fa");
    caret.toggleClass("fa-caret-right");
    caret.toggleClass("fa-caret-down");
    
  });
  
  //Initialize the dropdown-contents hidden
  $('.dropdown-content').addClass("hidden");
  
});