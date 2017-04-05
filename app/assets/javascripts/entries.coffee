$ ->
  $('.entry-editor').each (i, el) ->
    setupQuill el

  flatpickr ".datepicker", 
    wrap: true
    maxDate: new Date()
    onChange: (_, date) ->
      Turbolinks.visit date

  $('.entry-authors .author-name').on 'click', (e) ->
    tab = $(@)
    entryId = tab.data('entry')
    console.log entryId
    $('.entry-authors, .entry').removeClass 'active'
    tab.parent().addClass 'active'
    $(entryId).addClass 'active'

quillOptions =
  theme: 'bubble'

setupQuill = (container) ->
  quillOptions['readOnly'] = (container.getAttribute('data-disabled') == 'true')

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