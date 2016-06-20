require 'rails_helper'

RSpec.describe "reproductions/show", type: :view do
  before(:each) do
    @reproduction = assign(:reproduction, Reproduction.create!(
      :animal => nil,
      :animal => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
