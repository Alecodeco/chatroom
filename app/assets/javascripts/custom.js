scroll_bottom = function() {
  $('#message-container ').stop().animate({
    scrollTop: $('#message-container')[0].scrollHeight
  }, 800);
}

activate_send_button = function() {
  if ($('#chat_textfield').val() ==  "")
    $('#send_button').attr('disabled', true);

  $('#chat_textfield').keyup(function() {
    if ($('#chat_textfield').val() !=  "")
      $('#send_button').attr('disabled', false);
    else
      $('#send_button').attr('disabled', true);
  });
}

$(document).on('turbolinks:load', function() {
  $('.ui.dropdown').dropdown();
  $('.ui.checkbox').checkbox();
  $('.message .close').on('click', function() {
    $(this).closest('.message').transition('fade');
  });
  $("#chat_form").bind("ajax:complete", function(event,xhr,status) {
    $('#chat_textfield').val('');
  });
  scroll_bottom();
  activate_send_button();





})
