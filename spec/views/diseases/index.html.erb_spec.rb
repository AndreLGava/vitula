require 'rails_helper'

RSpec.describe "diseases/index", type: :view do
  before(:each) do
    assign(:diseases, [
      Disease.create!(
        :vulgarname => "Vulgarname",
        :cientificname => "Cientificname",
        :causes => "MyText",
        :description => "MyText",
        :symptoms => "MyText"
      ),
      Disease.create!(
        :vulgarname => "Vulgarname",
        :cientificname => "Cientificname",
        :causes => "MyText",
        :description => "MyText",
        :symptoms => "MyText"
      )
    ])
  end

  it "renders a list of diseases" do
    render
    assert_select "tr>td", :text => "Vulgarname".to_s, :count => 2
    assert_select "tr>td", :text => "Cientificname".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
