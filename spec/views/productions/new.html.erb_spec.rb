require 'rails_helper'

RSpec.describe "productions/new", type: :view do
  before(:each) do
    assign(:production, Production.new(
      :amount => 1.5,
      :observation => "MyText",
      :animal => nil
    ))
  end

  it "renders new production form" do
    render

    assert_select "form[action=?][method=?]", productions_path, "post" do

      assert_select "input#production_amount[name=?]", "production[amount]"

      assert_select "textarea#production_observation[name=?]", "production[observation]"

      assert_select "input#production_animal_id[name=?]", "production[animal_id]"
    end
  end
end
