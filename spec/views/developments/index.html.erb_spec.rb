require 'rails_helper'

RSpec.describe "developments/index", type: :view do
  before(:each) do
    assign(:developments, [
      Development.create!(
        :weight => 1.5,
        :height => 1.5,
        :animal => nil
      ),
      Development.create!(
        :weight => 1.5,
        :height => 1.5,
        :animal => nil
      )
    ])
  end

  it "renders a list of developments" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
