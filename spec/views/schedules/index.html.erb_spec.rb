require 'rails_helper'

RSpec.describe "schedules/index", type: :view do
  before(:each) do
    assign(:schedules, [
      Schedule.create!(
        :event => nil,
        :batch => nil,
        :observation => "MyText"
      ),
      Schedule.create!(
        :event => nil,
        :batch => nil,
        :observation => "MyText"
      )
    ])
  end

  it "renders a list of schedules" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
