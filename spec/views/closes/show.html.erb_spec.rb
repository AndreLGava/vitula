require 'rails_helper'

RSpec.describe "closes/show", type: :view do
  before(:each) do
    @close = assign(:close, Close.create!(
      :totalvalue => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
  end
end
