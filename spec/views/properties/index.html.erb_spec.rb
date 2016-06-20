require 'rails_helper'

RSpec.describe "properties/index", type: :view do
  before(:each) do
    assign(:properties, [
      Property.create!(
        :name => "Name",
        :description => "Description",
        :long => 1.5,
        :lat => 1.5
      ),
      Property.create!(
        :name => "Name",
        :description => "Description",
        :long => 1.5,
        :lat => 1.5
      )
    ])
  end

  it "renders a list of properties" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
