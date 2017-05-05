require 'rails_helper'

RSpec.describe "diets/new", type: :view do
  before(:each) do
    assign(:diet, Diet.new(
      :amount => "9.99",
      :animal => nil,
      :stock => nil
    ))
  end

  it "renders new diet form" do
    render

    assert_select "form[action=?][method=?]", diets_path, "post" do

      assert_select "input#diet_amount[name=?]", "diet[amount]"

      assert_select "input#diet_animal_id[name=?]", "diet[animal_id]"

      assert_select "input#diet_stock_id[name=?]", "diet[stock_id]"
    end
  end
end
