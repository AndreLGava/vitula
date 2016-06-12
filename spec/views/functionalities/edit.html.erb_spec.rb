require 'rails_helper'

RSpec.describe "functionalities/edit", type: :view do
  before(:each) do
    @functionality = assign(:functionality, Functionality.create!(
      :name => "MyString",
      :description => "MyString",
      :modulo => nil
    ))
  end

  it "renders the edit functionality form" do
    render

    assert_select "form[action=?][method=?]", functionality_path(@functionality), "post" do

      assert_select "input#functionality_name[name=?]", "functionality[name]"

      assert_select "input#functionality_description[name=?]", "functionality[description]"

      assert_select "input#functionality_modulo_id[name=?]", "functionality[modulo_id]"
    end
  end
end
