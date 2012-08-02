# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

hilite = (lang) ->
  $("pre."+lang).snippet lang,
    style: "acid"
    transparent: true
    showNum: false

$ ->
  hilite lang for lang in ['ruby', 'php', 'css', 'javascript', 'sql','html','shell','plain']