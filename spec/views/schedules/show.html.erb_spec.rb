require 'rails_helper'

RSpec.describe "schedules/show", type: :view do
  before(:each) do
    @schedule = assign(:schedule, Schedule.create!(
      :event => nil,
      :batch => nil,
      :observation => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
