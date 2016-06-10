require 'rails_helper'

RSpec.describe "funcionalities/new", type: :view do
  before(:each) do
    assign(:funcionality, Funcionality.new(
      :name => "MyString",
      :description => "MyString",
      :modulo => nil
    ))
  end

  it "renders new funcionality form" do
    render

    assert_select "form[action=?][method=?]", funcionalities_path, "post" do

      assert_select "input#funcionality_name[name=?]", "funcionality[name]"

      assert_select "input#funcionality_description[name=?]", "funcionality[description]"

      assert_select "input#funcionality_modulo_id[name=?]", "funcionality[modulo_id]"
    end
  end
end
