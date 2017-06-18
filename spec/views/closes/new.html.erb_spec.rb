require 'rails_helper'

RSpec.describe "closes/new", type: :view do
  before(:each) do
    assign(:close, Close.new(
      :totalvalue => "9.99"
    ))
  end

  it "renders new close form" do
    render

    assert_select "form[action=?][method=?]", closes_path, "post" do

      assert_select "input#close_totalvalue[name=?]", "close[totalvalue]"
    end
  end
end
