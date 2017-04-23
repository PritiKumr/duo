$ ->
  $('.editable').each (i, el) ->
    setupQuill el

  elements = document.querySelectorAll('.editable')
  editor = new MediumEditor(elements)

  # $('.ql-editor').atwho
  #     at: "@",
  #     data:['Peter', 'Tom', 'Anne']
  #     editableAtwhoQueryAttrs: { "data-fr-verified": true }

  flatpickr ".datepicker", 
    wrap: true
    onChange: (_, date) ->
      window.location.href = date

# toolbar =
#   theme: 'bubble'
  

setupQuill = (container) ->

  editor = new MediumEditor(container,
    toolbar:
      allowMultiParagraphSelection: true
      buttons: [
        'bold'
        'italic'
        'underline'
        'anchor'
        'h2'
        'h3'
        'quote'
      ]
      relativeContainer: null
      standardizeSelectionStart: false
      static: false
      align: 'center'
      sticky: false
      updateOnEmptySelection: false
    placeholder: text: '09iuhygv')
  console.log container.innerHTML

  editor.on 'change', ->
    console.log container
    $.ajax 
      url: container.getAttribute('data-url')
      data:
        entry:
          text: container.firstChild.innerHTML
      method: 'PUT'
      dataType: 'json'
  , 2000