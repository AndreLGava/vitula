ready = undefined

ready = ->
  $('.datepicker').datepicker
    autoclose: true
    todayBtn: true
    pickerPosition: 'bottom-left'
    format: 'dd/mm/yyyy'
    clearBtn: true
    language: 'pt-BR'
    calendarWeeks: true
    todayHighlight: true

$(document).ready ready
$(document).on 'page:change turbolinks:load ready page:load', ready