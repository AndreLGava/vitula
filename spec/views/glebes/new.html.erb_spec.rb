require 'rails_helper'

RSpec.describe "glebes/new", type: :view do
  before(:each) do
    assign(:glebe, Glebe.new(
      :name => "MyString",
      :purpose => 1,
      :area => "9.99",
      :property => nil
    ))
  end

  it "renders new glebe form" do
    render

    assert_select "form[action=?][method=?]", glebes_path, "post" do

      assert_select "input#glebe_name[name=?]", "glebe[name]"

      assert_select "input#glebe_purpose[name=?]", "glebe[purpose]"

      assert_select "input#glebe_area[name=?]", "glebe[area]"

      assert_select "input#glebe_property_id[name=?]", "glebe[property_id]"
    end
  end
end
