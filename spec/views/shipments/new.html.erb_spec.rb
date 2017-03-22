require 'rails_helper'

RSpec.describe "shipments/new", type: :view do
  before(:each) do
    assign(:shipment, Shipment.new(
      :amount => "9.99"
    ))
  end

  it "renders new shipment form" do
    render

    assert_select "form[action=?][method=?]", shipments_path, "post" do

      assert_select "input#shipment_amount[name=?]", "shipment[amount]"
    end
  end
end
