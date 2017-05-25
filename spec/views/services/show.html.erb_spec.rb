require 'rails_helper'

RSpec.describe "services/show", type: :view do
  before(:each) do
    @service = assign(:service, Service.create!(
      :provider => "Provider",
      :goal => "Goal",
      :property => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Provider/)
    expect(rendered).to match(/Goal/)
    expect(rendered).to match(//)
  end
end
