require 'rails_helper'

RSpec.describe "drugs/index", type: :view do
  before(:each) do
    assign(:drugs, [
      Drug.create!(
        :name => "Name",
        :laboratory => "Laboratory",
        :reference => "Reference",
        :presentation => "MyText",
        :use => "MyText",
        :composition => "MyText",
        :indication => "MyText",
        :contraindication => "MyText",
        :warning => "MyText",
        :interaction => "MyText",
        :effect => "MyText",
        :dosage => "MyText",
        :overdosage => "MyText",
        :properties => "MyText",
        :species => "MyText"
      ),
      Drug.create!(
        :name => "Name",
        :laboratory => "Laboratory",
        :reference => "Reference",
        :presentation => "MyText",
        :use => "MyText",
        :composition => "MyText",
        :indication => "MyText",
        :contraindication => "MyText",
        :warning => "MyText",
        :interaction => "MyText",
        :effect => "MyText",
        :dosage => "MyText",
        :overdosage => "MyText",
        :properties => "MyText",
        :species => "MyText"
      )
    ])
  end

  it "renders a list of drugs" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Laboratory".to_s, :count => 2
    assert_select "tr>td", :text => "Reference".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
