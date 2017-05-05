require 'rails_helper'

RSpec.describe "bins/show", type: :view do
  before(:each) do
    @bin = assign(:bin, Bin.create!(
      :capacity => "9.99",
      :property => nil,
      :kind => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
  end
end
