require 'rails_helper'

RSpec.describe "treatments/show", type: :view do
  before(:each) do
    @treatment = assign(:treatment, Treatment.create!(
      :dosage => "9.99",
      :lack => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/1/)
  end
end
