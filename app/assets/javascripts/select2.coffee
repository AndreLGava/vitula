select_filtros = undefined

select_filtros = ->
  $('select').not('select[multiple]').select2
    theme: 'bootstrap'
    allowClear: true
    cache: true
    autocomplete: true
    width: '100%'
  return

$(document).ready select_filtros
$(document).on 'page:load', select_filtros
