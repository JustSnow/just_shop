#= require jquery/dist/jquery
#= require jquery-ujs/src/rails

#= require bootstrap-sass/assets/javascripts/bootstrap-sprockets

#= require_self

window.withElement = (selector, callback) ->
  callback selector if $(selector).length
