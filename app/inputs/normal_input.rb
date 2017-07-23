class NormalInput < SimpleForm::Inputs::Base
  def input
    template.content_tag(:div, class: 'input-group') do
      template.concat @builder.text_field(attribute_name, input_html_options)
      template.concat span
    end
  end

  def input_html_options
    value = options[:before] == '%' ? 'percentual' : options[:before]
    super.merge({class: "form-control #{value}", readonly: false})
  end

  def span
    template.content_tag(:span, class: 'input-group-addon') do
      template.concat icon
    end
  end

  def icon
    "<i> #{options[:before]} </i>".html_safe
  end

end
