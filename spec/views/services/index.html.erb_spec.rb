require 'rails_helper'

RSpec.describe "services/index", type: :view do
  before(:each) do
    assign(:services, [
      Service.create!(
        :provider => "Provider",
        :goal => "Goal",
        :property => nil
      ),
      Service.create!(
        :provider => "Provider",
        :goal => "Goal",
        :property => nil
      )
    ])
  end

  it "renders a list of services" do
    render
    assert_select "tr>td", :text => "Provider".to_s, :count => 2
    assert_select "tr>td", :text => "Goal".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
