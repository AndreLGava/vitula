class MmInput < SimpleForm::Inputs::Base
  def input
    template.content_tag(:div, class: 'input-group') do
      template.concat @builder.text_field(attribute_name, input_html_options)
      template.concat span
    end
  end

  def input_html_options
    super.merge({class: 'form-control', readonly: false})
  end

  def span
    template.content_tag(:span, class: 'input-group-addon') do
      template.concat icon
    end
  end

  def icon
    "<i> mm </i>".html_safe
  end

end
