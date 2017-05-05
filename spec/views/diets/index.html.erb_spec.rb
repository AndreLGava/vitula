require 'rails_helper'

RSpec.describe "diets/index", type: :view do
  before(:each) do
    assign(:diets, [
      Diet.create!(
        :amount => "9.99",
        :animal => nil,
        :stock => nil
      ),
      Diet.create!(
        :amount => "9.99",
        :animal => nil,
        :stock => nil
      )
    ])
  end

  it "renders a list of diets" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
