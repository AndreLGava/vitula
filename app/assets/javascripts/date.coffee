datepick = undefined

datepick = ->
  $('.datepicker').datepicker
    autoclose: true
    todayBtn: true
    pickerPosition: 'bottom-left'
    format: 'dd/mm/yyyy'
    clearBtn: true
    language: 'pt-BR'
    calendarWeeks: true
    todayHighlight: true

$(document).ready datepick
$(document).on 'page:load', datepick