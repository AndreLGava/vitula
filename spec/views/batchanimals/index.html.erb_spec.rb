require 'rails_helper'

RSpec.describe "batchanimals/index", type: :view do
  before(:each) do
    assign(:batchanimals, [
      Batchanimal.create!(
        :animal => nil,
        :batch => nil
      ),
      Batchanimal.create!(
        :animal => nil,
        :batch => nil
      )
    ])
  end

  it "renders a list of batchanimals" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
