require 'rails_helper'

RSpec.describe "illnesses/edit", type: :view do
  before(:each) do
    @illness = assign(:illness, Illness.create!(
      :sequel => "MyText",
      :animal => nil,
      :disease => nil
    ))
  end

  it "renders the edit illness form" do
    render

    assert_select "form[action=?][method=?]", illness_path(@illness), "post" do

      assert_select "textarea#illness_sequel[name=?]", "illness[sequel]"

      assert_select "input#illness_animal_id[name=?]", "illness[animal_id]"

      assert_select "input#illness_disease_id[name=?]", "illness[disease_id]"
    end
  end
end
