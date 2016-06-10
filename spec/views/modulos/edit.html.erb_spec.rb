require 'rails_helper'

RSpec.describe "modulos/edit", type: :view do
  before(:each) do
    @modulo = assign(:modulo, Modulo.create!(
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit modulo form" do
    render

    assert_select "form[action=?][method=?]", modulo_path(@modulo), "post" do

      assert_select "input#modulo_name[name=?]", "modulo[name]"

      assert_select "input#modulo_description[name=?]", "modulo[description]"
    end
  end
end
