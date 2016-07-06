require 'rails_helper'

RSpec.describe "developments/show", type: :view do
  before(:each) do
    @development = assign(:development, Development.create!(
      :weight => 1.5,
      :height => 1.5,
      :animal => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(//)
  end
end
