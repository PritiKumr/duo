// app/assets/javascripts/channels/entries.js

//= require cable
//= require_self
//= require_tree .

this.App = {};

App.cable = ActionCable.createConsumer();

App.messages = App.cable.subscriptions.create('EntriesChannel', {  
  received: function(data) {
  	var class_name = $("#entry_" + data.id).attr('class');
  	if (class_name.indexOf('active') == -1) {
      return $("#entry_" + data.id + " .ql-editor").html(this.renderMessage(data));
    }
  },

  renderMessage: function(data) {
    return data.entry;
  }
});