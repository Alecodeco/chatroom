$(document).on('turbolinks:load', function() {
  $('.ui.dropdown').dropdown();
  $('.ui.checkbox').checkbox();
  $('.message .close').on('click', function() {
    $(this).closest('.message').transition('fade');
  });
  
})
