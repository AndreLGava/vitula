require 'rails_helper'

RSpec.describe "lots/edit", type: :view do
  before(:each) do
    @lot = assign(:lot, Lot.create!(
      :name => "MyString",
      :description => "MyString",
      :property => nil
    ))
  end

  it "renders the edit lot form" do
    render

    assert_select "form[action=?][method=?]", lot_path(@lot), "post" do

      assert_select "input#lot_name[name=?]", "lot[name]"

      assert_select "input#lot_description[name=?]", "lot[description]"

      assert_select "input#lot_property_id[name=?]", "lot[property_id]"
    end
  end
end
