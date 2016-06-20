require 'rails_helper'

RSpec.describe "reproductions/index", type: :view do
  before(:each) do
    assign(:reproductions, [
      Reproduction.create!(
        :animal => nil,
        :animal => nil
      ),
      Reproduction.create!(
        :animal => nil,
        :animal => nil
      )
    ])
  end

  it "renders a list of reproductions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
