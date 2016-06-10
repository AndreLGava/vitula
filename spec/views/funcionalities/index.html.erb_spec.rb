require 'rails_helper'

RSpec.describe "funcionalities/index", type: :view do
  before(:each) do
    assign(:funcionalities, [
      Funcionality.create!(
        :name => "Name",
        :description => "Description",
        :modulo => nil
      ),
      Funcionality.create!(
        :name => "Name",
        :description => "Description",
        :modulo => nil
      )
    ])
  end

  it "renders a list of funcionalities" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
