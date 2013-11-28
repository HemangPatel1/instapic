# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

connection = new WebSocketRails(window.location.host + '/websocket')
channel = connection.subscribe('pics')

channel.bind 'new', (pic) ->
	console.log(pic)
	$pic = $('.all_pics table:last').clone();

	$pic.find('.captioning').text pic.caption
	$pic.find('img').attr 'src', pic['image_url']
	$pic.find('strong').text pic.username
	$pic.find('small').text pic.created_at
	$pic.find('.tags').text pic.tags
	$('.all_pics').prepend($pic)