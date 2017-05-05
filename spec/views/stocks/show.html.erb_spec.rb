require 'rails_helper'

RSpec.describe "stocks/show", type: :view do
  before(:each) do
    @stock = assign(:stock, Stock.create!(
      :bin => nil,
      :feed => nil,
      :glebe => nil,
      :amount => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
  end
end
