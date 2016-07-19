require 'rails_helper'

RSpec.describe "lots/new", type: :view do
  before(:each) do
    assign(:lot, Lot.new(
      name: "MyString",
      :description => "MyString",
      :property => nil
    ))
  end

  it "renders new lot form" do
    render

    assert_select "form[action=?][method=?]", lots_path, "post" do

      assert_select "input#lot_name[name=?]", "lot[name]"

      assert_select "input#lot_description[name=?]", "lot[description]"

      assert_select "input#lot_property_id[name=?]", "lot[property_id]"
    end
  end
end
