$ ->
  $.each document.getElementsByClassName('entry-editor'), (i, el) ->
    setupQuill el

quillOptions =
  theme: 'bubble'

setupQuill = (container) ->
  editor = new Quill container, quillOptions
  editor.on 'text-change', (delta, oldDelta, source) ->
    editor.getText()