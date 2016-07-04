require 'rails_helper'

RSpec.describe "productions/edit", type: :view do
  before(:each) do
    @production = assign(:production, Production.create!(
      :amount => 1.5,
      :observation => "MyText",
      :animal => nil
    ))
  end

  it "renders the edit production form" do
    render

    assert_select "form[action=?][method=?]", production_path(@production), "post" do

      assert_select "input#production_amount[name=?]", "production[amount]"

      assert_select "textarea#production_observation[name=?]", "production[observation]"

      assert_select "input#production_animal_id[name=?]", "production[animal_id]"
    end
  end
end
