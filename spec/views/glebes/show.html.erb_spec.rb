require 'rails_helper'

RSpec.describe "glebes/show", type: :view do
  before(:each) do
    @glebe = assign(:glebe, Glebe.create!(
      :name => "Name",
      :purpose => 1,
      :area => "9.99",
      :property => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
