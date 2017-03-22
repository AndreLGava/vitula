require 'rails_helper'

RSpec.describe "shipments/index", type: :view do
  before(:each) do
    assign(:shipments, [
      Shipment.create!(
        :amount => "9.99"
      ),
      Shipment.create!(
        :amount => "9.99"
      )
    ])
  end

  it "renders a list of shipments" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
