//Component for datepicker

  $(document).ready(function(){
    $('.datepicker').datepicker({
      format: "dd/mm/yyyy",
      todayBtn: true,
      clearBtn: true,
      language: "pt-BR",
      calendarWeeks: true,
      autoclose: false,
      todayHighlight: true
    });
  });

  $(document).ready(function(){
    $('.datetimepicker').datepicker({
      format: "dd/mm/yyyy hh:mm",
      todayBtn: true,
      clearBtn: true,
      language: "pt-BR",
      calendarWeeks: true,
      autoclose: false,
      todayHighlight: true
    });
  });
  