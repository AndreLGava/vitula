require 'rails_helper'

RSpec.describe "diets/show", type: :view do
  before(:each) do
    @diet = assign(:diet, Diet.create!(
      :amount => "9.99",
      :animal => nil,
      :stock => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
