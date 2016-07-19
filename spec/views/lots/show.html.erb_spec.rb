require 'rails_helper'

RSpec.describe "lots/show", type: :view do
  before(:each) do
    @lot = assign(:lot, Lot.create!(
      name: "Name",
      :description => "Description",
      :property => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
  end
end
