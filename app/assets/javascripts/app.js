$(document).on('turbolinks:load', function() {
  var href = window.location.href.match(/articles/)
  if(href){
    reg = "</p>"
    var article_text = document.getElementById('article-text').innerText.replace(/<p>/,"").replace(reg,"")
    article_text = article_text.replace(/(#)(.+)/g,"<h2>$2</h2>")
    $("#article-text").html(article_text)
  }
});
