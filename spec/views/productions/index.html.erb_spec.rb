require 'rails_helper'

RSpec.describe "productions/index", type: :view do
  before(:each) do
    assign(:productions, [
      Production.create!(
        :amount => 1.5,
        :observation => "MyText",
        :animal => nil
      ),
      Production.create!(
        :amount => 1.5,
        :observation => "MyText",
        :animal => nil
      )
    ])
  end

  it "renders a list of productions" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
