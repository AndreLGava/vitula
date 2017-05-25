require 'rails_helper'

RSpec.describe "batches/show", type: :view do
  before(:each) do
    @batch = assign(:batch, Batch.create!(
      :name => "Name",
      :observation => "MyText",
      :type => 1,
      :glebe => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
  end
end
