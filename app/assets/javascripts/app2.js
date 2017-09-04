$(document).on('turbolinks:load', function() {
  $(".minus").on("click", function(){
    $(".message").toggleClass('display-none');
    $(".message2").toggleClass('display-none')
  });
});
