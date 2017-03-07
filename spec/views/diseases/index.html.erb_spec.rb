require 'rails_helper'

RSpec.describe "diseases/index", type: :view do
  before(:each) do
    assign(:diseases, [
      Disease.create!(
        :VulgarName => "Vulgar Name",
        :CientificName => "Cientific Name",
        :Causes => "MyText",
        :Description => "MyText",
        :Symptoms => "MyText"
      ),
      Disease.create!(
        :VulgarName => "Vulgar Name",
        :CientificName => "Cientific Name",
        :Causes => "MyText",
        :Description => "MyText",
        :Symptoms => "MyText"
      )
    ])
  end

  it "renders a list of diseases" do
    render
    assert_select "tr>td", :text => "Vulgar Name".to_s, :count => 2
    assert_select "tr>td", :text => "Cientific Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
