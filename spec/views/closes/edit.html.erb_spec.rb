require 'rails_helper'

RSpec.describe "closes/edit", type: :view do
  before(:each) do
    @close = assign(:close, Close.create!(
      :totalvalue => "9.99"
    ))
  end

  it "renders the edit close form" do
    render

    assert_select "form[action=?][method=?]", close_path(@close), "post" do

      assert_select "input#close_totalvalue[name=?]", "close[totalvalue]"
    end
  end
end
