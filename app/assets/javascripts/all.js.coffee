@hilite = (lang) ->
  $("pre."+lang).snippet lang,
    style: "acid"
    transparent: true
    showNum: false

@hilite_langs = ->
  hilite lang for lang in ['ruby', 'php', 'css', 'javascript', 'sql','html','shell','plain']