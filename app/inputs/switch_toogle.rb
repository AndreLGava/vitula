class SwitchToogle < SimpleForm::Inputs::Base

  def input(wrapper_options)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

    "$ #{@builder.text_field(attribute_name, merged_input_options)}".html_safe
  end
  def label_add
    template.content_tag(:label, class: 'switch') do
      "$ #{@builder.text_field(attribute_name, merged_input_options)}".html_safe
      template.concat icon_remove
    end
  end

  def description_label(yes, no)
    "<span class='switch-label' data-on='#{yes}' data-off='#{no}'></span>"
  end

  def switch_toogle
    "<label class='switch pull-right'>
        <input type='checkbox' id='input' class='switch-input switch-primary'>
        <span class='switch-label' data-on='' data-off=''></span>
        <span class='switch-handle'></span>
      </label>".html_safe
  end
end
