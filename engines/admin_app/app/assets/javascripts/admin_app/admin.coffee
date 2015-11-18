#= require_self

window.withElement = (selector, callback) ->
  callback selector if $(selector).length
