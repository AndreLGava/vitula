require 'rails_helper'

RSpec.describe "stocks/new", type: :view do
  before(:each) do
    assign(:stock, Stock.new(
      :bin => nil,
      :feed => nil,
      :glebe => nil,
      :amount => "9.99"
    ))
  end

  it "renders new stock form" do
    render

    assert_select "form[action=?][method=?]", stocks_path, "post" do

      assert_select "input#stock_bin_id[name=?]", "stock[bin_id]"

      assert_select "input#stock_feed_id[name=?]", "stock[feed_id]"

      assert_select "input#stock_glebe_id[name=?]", "stock[glebe_id]"

      assert_select "input#stock_amount[name=?]", "stock[amount]"
    end
  end
end
