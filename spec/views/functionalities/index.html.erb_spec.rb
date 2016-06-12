require 'rails_helper'

RSpec.describe "functionalities/index", type: :view do
  before(:each) do
    assign(:functionalities, [
      Functionality.create!(
        :name => "Name",
        :description => "Description",
        :modulo => nil
      ),
      Functionality.create!(
        :name => "Name",
        :description => "Description",
        :modulo => nil
      )
    ])
  end

  it "renders a list of functionalities" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
