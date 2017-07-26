ready = undefined

ready = ->
  $('.date').mask '00/00/0000'
  $('.time').mask '00:00:00'
  $('.Kg').mask '0.000,00', reverse: true
  $('.cm').mask '0.000,00', reverse: true
  $('.T').mask '0.000,00', reverse: true
  $('.percentual').mask '#0.00', reverse: true
  $('.G').mask '0.000,00', reverse: true
  $('.Ton').mask '0.000.000,00', reverse: true
  $('.L').mask '0.000.000,00', reverse: true
  $('.ml').mask '0.000,00', reverse: true
  $('.cm³').mask '#0.00', reverse: true
  $('.M³').mask '0.000,00', reverse: true
  $('.M').mask '000,00', reverse: true
  $('.mm').mask '000,00', reverse: true
  $('.Ha').mask '0.000.000,0', reverse: true
  $('.date_time').mask '00/00/0000 00:00:00'
  $('.datepicker').mask '00/00/0000'
  $('.datetimepicker').mask '00/00/0000 00:00:00'
  $('.CEP').mask '00000-000'
  $('.phone').mask '00000-0000'
  $('.phone_with_ddd').mask '(00) 00000-0000'
  $('.mixed').mask 'AAA 000-S0S'
  $('.CPF').mask '000.000.000-00', reverse: true
  $('.cnpj').mask '00.000.000/0000-00', reverse: true
  $('.money').mask '000.000.000.000.000,00', reverse: true
  $('.money2').mask '#.##0,00', reverse: true
  $('.ip_address').mask '0ZZ.0ZZ.0ZZ.0ZZ', translation: 'Z':
    pattern: /[0-9]/
    optional: true
  $('.ip_address').mask '099.099.099.099'
  $('.percent').mask '##0,00%', reverse: true
  $('.clear-if-not-match').mask '00/00/0000', clearIfNotMatch: true
  $('.placeholder').mask '00/00/0000', placeholder: '__/__/____'
  $('.fallback').mask '00r00r0000', translation:
    'r':
      pattern: /[\/]/
      fallback: '/'
    placeholder: '__/__/____'
  $('.selectonfocus').mask '00/00/0000', selectOnFocus: true
  return

$(document).ready ready
$(document).on 'page:load', ready