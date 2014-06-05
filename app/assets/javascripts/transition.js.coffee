$(document).on 'page:fetch', ->
  $('#animated-content').fadeOut 'slow'

$(document).on 'page:restore', ->
  $('#animated-content').fadeIn 'slow'
