require 'rails_helper'

RSpec.describe "modulos/index", type: :view do
  before(:each) do
    assign(:modulos, [
      Modulo.create!(
        :name => "Name",
        :description => "Description"
      ),
      Modulo.create!(
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of modulos" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
