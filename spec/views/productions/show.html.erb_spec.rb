require 'rails_helper'

RSpec.describe "productions/show", type: :view do
  before(:each) do
    @production = assign(:production, Production.create!(
      :amount => 1.5,
      :observation => "MyText",
      :animal => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
