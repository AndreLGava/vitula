require 'rails_helper'

RSpec.describe "properties/edit", type: :view do
  before(:each) do
    @property = assign(:property, Property.create!(
      :name => "MyString",
      :description => "MyString",
      :long => 1.5,
      :lat => 1.5
    ))
  end

  it "renders the edit property form" do
    render

    assert_select "form[action=?][method=?]", property_path(@property), "post" do

      assert_select "input#property_name[name=?]", "property[name]"

      assert_select "input#property_description[name=?]", "property[description]"

      assert_select "input#property_long[name=?]", "property[long]"

      assert_select "input#property_lat[name=?]", "property[lat]"
    end
  end
end
