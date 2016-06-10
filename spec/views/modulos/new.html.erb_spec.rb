require 'rails_helper'

RSpec.describe "modulos/new", type: :view do
  before(:each) do
    assign(:modulo, Modulo.new(
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new modulo form" do
    render

    assert_select "form[action=?][method=?]", modulos_path, "post" do

      assert_select "input#modulo_name[name=?]", "modulo[name]"

      assert_select "input#modulo_description[name=?]", "modulo[description]"
    end
  end
end
