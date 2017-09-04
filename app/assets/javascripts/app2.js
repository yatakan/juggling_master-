$(document).on('turbolinks:load', function() {
  $(".minus").on("click", function(){
    console.log('aa')
    $(".message").toggleClass('display-none');
  });
});
