require 'rails_helper'

RSpec.describe "funcionalities/edit", type: :view do
  before(:each) do
    @funcionality = assign(:funcionality, Funcionality.create!(
      :name => "MyString",
      :description => "MyString",
      :modulo => nil
    ))
  end

  it "renders the edit funcionality form" do
    render

    assert_select "form[action=?][method=?]", funcionality_path(@funcionality), "post" do

      assert_select "input#funcionality_name[name=?]", "funcionality[name]"

      assert_select "input#funcionality_description[name=?]", "funcionality[description]"

      assert_select "input#funcionality_modulo_id[name=?]", "funcionality[modulo_id]"
    end
  end
end
