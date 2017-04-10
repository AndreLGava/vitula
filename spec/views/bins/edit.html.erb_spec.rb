require 'rails_helper'

RSpec.describe "bins/edit", type: :view do
  before(:each) do
    @bin = assign(:bin, Bin.create!(
      :capacity => "9.99",
      :property => nil,
      :kind => 1
    ))
  end

  it "renders the edit bin form" do
    render

    assert_select "form[action=?][method=?]", bin_path(@bin), "post" do

      assert_select "input#bin_capacity[name=?]", "bin[capacity]"

      assert_select "input#bin_property_id[name=?]", "bin[property_id]"

      assert_select "input#bin_kind[name=?]", "bin[kind]"
    end
  end
end
