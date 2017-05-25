require 'rails_helper'

RSpec.describe "batches/index", type: :view do
  before(:each) do
    assign(:batches, [
      Batch.create!(
        :name => "Name",
        :observation => "MyText",
        :type => 1,
        :glebe => nil
      ),
      Batch.create!(
        :name => "Name",
        :observation => "MyText",
        :type => 1,
        :glebe => nil
      )
    ])
  end

  it "renders a list of batches" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
