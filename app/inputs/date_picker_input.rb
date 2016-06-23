class DatePickerInput < SimpleForm::Inputs::Base
  def input
    template.content_tag(:div, class: 'input-group date form_datetime ') do
      template.concat @builder.text_field(attribute_name, input_html_options)
      #template.concat span_remove
      template.concat span_calendar
    end
  end

  def input_html_options
    super.merge({class: 'form-control datepicker', readonly: false})
  end

  def span_remove
    template.content_tag(:span, class: 'input-group-addon') do
      template.concat icon_remove
    end
  end

  def span_calendar
    template.content_tag(:span, class: 'input-group-addon') do
      template.concat icon_calendar
    end
  end

  def icon_remove
    "<i class='fa fa-remove'></i>".html_safe
  end

  def icon_calendar
    "<i class='fa fa-calendar'></i>".html_safe
  end

end
