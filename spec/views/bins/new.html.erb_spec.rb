require 'rails_helper'

RSpec.describe "bins/new", type: :view do
  before(:each) do
    assign(:bin, Bin.new(
      :capacity => "9.99",
      :property => nil,
      :kind => 1
    ))
  end

  it "renders new bin form" do
    render

    assert_select "form[action=?][method=?]", bins_path, "post" do

      assert_select "input#bin_capacity[name=?]", "bin[capacity]"

      assert_select "input#bin_property_id[name=?]", "bin[property_id]"

      assert_select "input#bin_kind[name=?]", "bin[kind]"
    end
  end
end
