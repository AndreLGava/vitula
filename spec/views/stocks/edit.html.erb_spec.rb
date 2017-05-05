require 'rails_helper'

RSpec.describe "stocks/edit", type: :view do
  before(:each) do
    @stock = assign(:stock, Stock.create!(
      :bin => nil,
      :feed => nil,
      :glebe => nil,
      :amount => "9.99"
    ))
  end

  it "renders the edit stock form" do
    render

    assert_select "form[action=?][method=?]", stock_path(@stock), "post" do

      assert_select "input#stock_bin_id[name=?]", "stock[bin_id]"

      assert_select "input#stock_feed_id[name=?]", "stock[feed_id]"

      assert_select "input#stock_glebe_id[name=?]", "stock[glebe_id]"

      assert_select "input#stock_amount[name=?]", "stock[amount]"
    end
  end
end
