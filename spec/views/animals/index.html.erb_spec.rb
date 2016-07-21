require 'rails_helper'

RSpec.describe "animals/index", type: :view do
  before(:each) do
    assign(:animals, [
      Animal.create!(
        :code => 1,
        name: "Name",
        :description => "Description",
        :female => false,
        :breed => "Breed",
        :lot => nil,
        :reproduction => nil
      ),
      Animal.create!(
        :code => 1,
        name: "Name",
        :description => "Description",
        :female => false,
        :breed => "Breed",
        :lot => nil,
        :reproduction => nil
      )
    ])
  end

  it "renders a list of animals" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Breed".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
