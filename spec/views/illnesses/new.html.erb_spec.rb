require 'rails_helper'

RSpec.describe "illnesses/new", type: :view do
  before(:each) do
    assign(:illness, Illness.new(
      :sequel => "MyText",
      :animal => nil,
      :disease => nil,
      :treatment => nil
    ))
  end

  it "renders new illness form" do
    render

    assert_select "form[action=?][method=?]", illnesses_path, "post" do

      assert_select "textarea#illness_sequel[name=?]", "illness[sequel]"

      assert_select "input#illness_animal_id[name=?]", "illness[animal_id]"

      assert_select "input#illness_disease_id[name=?]", "illness[disease_id]"

      assert_select "input#illness_treatment_id[name=?]", "illness[treatment_id]"
    end
  end
end
