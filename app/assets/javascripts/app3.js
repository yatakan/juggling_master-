$(document).on('turbolinks:load', function() {
  $(".close-button").on("click", function(){
    $("header ul").toggleClass('display-none');
  });
  $(".bars").on("click", function(){
    $("header ul").toggleClass('display-none');
  })
});
