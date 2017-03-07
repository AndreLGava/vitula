require 'rails_helper'

RSpec.describe "diseases/show", type: :view do
  before(:each) do
    @disease = assign(:disease, Disease.create!(
      :VulgarName => "Vulgar Name",
      :CientificName => "Cientific Name",
      :Causes => "MyText",
      :Description => "MyText",
      :Symptoms => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Vulgar Name/)
    expect(rendered).to match(/Cientific Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
