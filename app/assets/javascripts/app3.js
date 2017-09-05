$(document).on('turbolinks:load', function() {
  $(".close-button").on("click", function(){
    $("header ul").toggleClass('display-none');
  });
  $(".bars").on("click", function(){
    $("header ul").toggleClass('display-none');
  })
  $(".minus").on("click", function(){
    $(".message").toggleClass('display-none');
    $(".message2").toggleClass('display-none')
  });
  var href = window.location.href.match(/articles/)
  if(href){
    var article_text = $('#article-text').html().replace(/(#)(.+)/g,"<h2>$2</h2>")
    $("#article-text").html(article_text)
  }
});
