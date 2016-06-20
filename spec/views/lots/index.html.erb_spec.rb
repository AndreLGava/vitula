require 'rails_helper'

RSpec.describe "lots/index", type: :view do
  before(:each) do
    assign(:lots, [
      Lot.create!(
        :name => "Name",
        :description => "Description",
        :property => nil
      ),
      Lot.create!(
        :name => "Name",
        :description => "Description",
        :property => nil
      )
    ])
  end

  it "renders a list of lots" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
