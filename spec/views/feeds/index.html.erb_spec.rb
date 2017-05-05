require 'rails_helper'

RSpec.describe "feeds/index", type: :view do
  before(:each) do
    assign(:feeds, [
      Feed.create!(
        :kind => 1,
        :name => "Name",
        :description => "Description"
      ),
      Feed.create!(
        :kind => 1,
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of feeds" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
