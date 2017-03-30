$ ->
  $('.entry-date').click ->
    $( "#datepicker" ).datepicker()

  flatpickr ".datepicker", 
    wrap: true
    onChange: (_, date) ->
      window.location.href = date

quillOptions =
  theme: 'bubble'

setupQuill = (container, userName) ->
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