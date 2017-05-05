require 'rails_helper'

RSpec.describe "bins/index", type: :view do
  before(:each) do
    assign(:bins, [
      Bin.create!(
        :capacity => "9.99",
        :property => nil,
        :kind => 1
      ),
      Bin.create!(
        :capacity => "9.99",
        :property => nil,
        :kind => 1
      )
    ])
  end

  it "renders a list of bins" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
