require 'rails_helper'

RSpec.describe "modulos/show", type: :view do
  before(:each) do
    @modulo = assign(:modulo, Modulo.create!(
      :name => "Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
  end
end
