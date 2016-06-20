require 'rails_helper'

RSpec.describe "animals/show", type: :view do
  before(:each) do
    @animal = assign(:animal, Animal.create!(
      :code => 1,
      :name => "Name",
      :description => "Description",
      :female => false,
      :breed => "Breed",
      :lot => nil,
      :reproduction => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Breed/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
