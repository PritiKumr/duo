$ ->
  console.log 'fuck'
  setupQuill 'entry_one'
  setupQuill 'entry_two'
  
  

quillOptions =
  theme: 'bubble'

setupQuill = (containerId) ->
  new Quill document.getElementById(containerId), quillOptions