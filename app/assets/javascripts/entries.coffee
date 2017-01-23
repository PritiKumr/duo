$ ->
  $('.entry-editor').each (i, el) ->
    setupQuill el

quillOptions =
  theme: 'bubble'

setupQuill = (container) ->
  editor = new Quill container, quillOptions
  editor.on 'text-change', DuoUtils.debounce (delta, oldDelta, source) ->
    $.ajax 
      url: container.getAttribute('data-url')
      data:
        entry:
          text: container.firstChild.innerHTML
      method: 'PUT'
      dataType: 'json'
  , 2000