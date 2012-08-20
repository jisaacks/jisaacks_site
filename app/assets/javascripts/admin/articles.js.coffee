# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  update_preview()
  $("#admin #article_content").keyup update_preview

update_preview = ->
  content = $("#admin #article_content").val()
  $(".article-preview .article-content").html(content)
  hilite_langs()