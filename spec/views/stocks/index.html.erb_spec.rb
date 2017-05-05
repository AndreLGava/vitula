require 'rails_helper'

RSpec.describe "stocks/index", type: :view do
  before(:each) do
    assign(:stocks, [
      Stock.create!(
        :bin => nil,
        :feed => nil,
        :glebe => nil,
        :amount => "9.99"
      ),
      Stock.create!(
        :bin => nil,
        :feed => nil,
        :glebe => nil,
        :amount => "9.99"
      )
    ])
  end

  it "renders a list of stocks" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
