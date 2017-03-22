require 'rails_helper'

RSpec.describe "shipments/show", type: :view do
  before(:each) do
    @shipment = assign(:shipment, Shipment.create!(
      :amount => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
  end
end
