    $(document).ready ->
      $('select').not('select[multiple]').select2
        theme: 'bootstrap'
        allowClear: true
        cache: true
        autocomplete: true
        width: '100%'
      return