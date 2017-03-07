require 'rails_helper'

RSpec.describe "illnesses/index", type: :view do
  before(:each) do
    assign(:illnesses, [
      Illness.create!(
        :sequel => "MyText",
        :animal => nil,
        :disease => nil
      ),
      Illness.create!(
        :sequel => "MyText",
        :animal => nil,
        :disease => nil
      )
    ])
  end

  it "renders a list of illnesses" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
