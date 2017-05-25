require 'rails_helper'

RSpec.describe "financials/show", type: :view do
  before(:each) do
    @financial = assign(:financial, Financial.create!(
      :value => "9.99",
      :operation => 1,
      :description => "MyText",
      :animal => nil,
      :service => nil,
      :employee => nil,
      :reproduction => nil,
      :stock => nil,
      :treatment => nil,
      :shipment => nil,
      :schedule => nil,
      :service => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
