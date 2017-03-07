require 'rails_helper'

RSpec.describe "illnesses/show", type: :view do
  before(:each) do
    @illness = assign(:illness, Illness.create!(
      :sequel => "MyText",
      :animal => nil,
      :disease => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
