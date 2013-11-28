# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

connection = new WebSocketRails(window.location.host + '/websocket')
channel = connection.subscribe('pics')

channel.bind 'new', (pic) ->
	$pic = $('.all_pics table:last').clone();

	$pic.find('h6').text pic.caption
	$pic.find('img').attr 'src', pic['image_url']

	$('.all_pics').prepend($pic)