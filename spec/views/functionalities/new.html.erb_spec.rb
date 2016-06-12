require 'rails_helper'

RSpec.describe "functionalities/new", type: :view do
  before(:each) do
    assign(:functionality, Functionality.new(
      :name => "MyString",
      :description => "MyString",
      :modulo => nil
    ))
  end

  it "renders new functionality form" do
    render

    assert_select "form[action=?][method=?]", functionalities_path, "post" do

      assert_select "input#functionality_name[name=?]", "functionality[name]"

      assert_select "input#functionality_description[name=?]", "functionality[description]"

      assert_select "input#functionality_modulo_id[name=?]", "functionality[modulo_id]"
    end
  end
end
