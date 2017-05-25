require 'rails_helper'

RSpec.describe "financials/index", type: :view do
  before(:each) do
    assign(:financials, [
      Financial.create!(
        :value => "9.99",
        :operation => 1,
        :description => "MyText",
        :animal => nil,
        :service => nil,
        :employee => nil,
        :reproduction => nil,
        :stock => nil,
        :treatment => nil,
        :shipment => nil,
        :schedule => nil,
        :service => nil
      ),
      Financial.create!(
        :value => "9.99",
        :operation => 1,
        :description => "MyText",
        :animal => nil,
        :service => nil,
        :employee => nil,
        :reproduction => nil,
        :stock => nil,
        :treatment => nil,
        :shipment => nil,
        :schedule => nil,
        :service => nil
      )
    ])
  end

  it "renders a list of financials" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
