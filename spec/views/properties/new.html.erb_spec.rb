require 'rails_helper'

RSpec.describe "properties/new", type: :view do
  before(:each) do
    assign(:property, Property.new(
      :name => "MyString",
      :description => "MyString",
      :long => 1.5,
      :lat => 1.5
    ))
  end

  it "renders new property form" do
    render

    assert_select "form[action=?][method=?]", properties_path, "post" do

      assert_select "input#property_name[name=?]", "property[name]"

      assert_select "input#property_description[name=?]", "property[description]"

      assert_select "input#property_long[name=?]", "property[long]"

      assert_select "input#property_lat[name=?]", "property[lat]"
    end
  end
end
