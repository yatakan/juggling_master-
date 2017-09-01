$(document).on('turbolinks:load', function() {
  var href = window.location.href.match(/articles/)
  if(href){
    var article_text = $('#article-text').html().replace(/(#)(.+)/g,"<h2>$2</h2>")
    $("#article-text").html(article_text)
  }
});
