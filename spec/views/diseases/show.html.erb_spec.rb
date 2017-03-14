require 'rails_helper'

RSpec.describe "diseases/show", type: :view do
  before(:each) do
    @disease = assign(:disease, Disease.create!(
      :vulgarname => "Vulgarname",
      :cientificname => "Cientificname",
      :causes => "MyText",
      :description => "MyText",
      :symptoms => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Vulgarname/)
    expect(rendered).to match(/Cientificname/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
