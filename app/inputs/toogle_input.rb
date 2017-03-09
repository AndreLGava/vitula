class ToogleInput < SimpleForm::Inputs::BooleanInput
  def input
    template.content_tag(:label, class: 'switch pull-right') do
      template.concat @builder.check_box(attribute_name, input_html_options)
      template.concat description_label("", "")
      template.concat button_handle
    end
  end

  def input_html_options
    super.merge({class: 'switch-input switch-primary'})
  end

  def description_label(yes, no)
    "<span class='switch-label' data-on='#{yes}' data-off='#{no}'></span>".html_safe
  end

  def button_handle
    "<span class='switch-handle'></span>".html_safe
  end

end
