scroll_bottom = function() {
  $('#message-container ').stop().animate({
    scrollTop: $('#message-container')[0].scrollHeight
  }, 800);
}

$(document).on('turbolinks:load', function() {
  $('.ui.dropdown').dropdown();
  $('.ui.checkbox').checkbox();
  $('.message .close').on('click', function() {
    $(this).closest('.message').transition('fade');
  });
  scroll_bottom();  
})
