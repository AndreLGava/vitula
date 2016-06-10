require 'rails_helper'

RSpec.describe "funcionalities/show", type: :view do
  before(:each) do
    @funcionality = assign(:funcionality, Funcionality.create!(
      :name => "Name",
      :description => "Description",
      :modulo => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
  end
end
