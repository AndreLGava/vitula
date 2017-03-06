require 'rails_helper'

RSpec.describe "glebes/index", type: :view do
  before(:each) do
    assign(:glebes, [
      Glebe.create!(
        :name => "Name",
        :purpose => 1,
        :area => "9.99",
        :property => nil
      ),
      Glebe.create!(
        :name => "Name",
        :purpose => 1,
        :area => "9.99",
        :property => nil
      )
    ])
  end

  it "renders a list of glebes" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
