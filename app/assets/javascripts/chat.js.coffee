# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

connection = new WebSocketRails(window.location.host + '/websocket')
channel = connection.subscribe('chat')

channel.bind 'new', (data) ->
	$(".chatbox").prepend 
	$("<div>" + data.chat + "</div>")

