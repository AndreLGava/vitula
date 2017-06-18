require 'rails_helper'

RSpec.describe "closes/index", type: :view do
  before(:each) do
    assign(:closes, [
      Close.create!(
        :totalvalue => "9.99"
      ),
      Close.create!(
        :totalvalue => "9.99"
      )
    ])
  end

  it "renders a list of closes" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
