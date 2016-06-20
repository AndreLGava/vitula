require 'rails_helper'

RSpec.describe "properties/show", type: :view do
  before(:each) do
    @property = assign(:property, Property.create!(
      :name => "Name",
      :description => "Description",
      :long => 1.5,
      :lat => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
  end
end
