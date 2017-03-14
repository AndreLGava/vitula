require 'rails_helper'

RSpec.describe "diseases/edit", type: :view do
  before(:each) do
    @disease = assign(:disease, Disease.create!(
      :vulgarname => "MyString",
      :cientificname => "MyString",
      :causes => "MyText",
      :description => "MyText",
      :symptoms => "MyText"
    ))
  end

  it "renders the edit disease form" do
    render

    assert_select "form[action=?][method=?]", disease_path(@disease), "post" do

      assert_select "input#disease_vulgarname[name=?]", "disease[vulgarname]"

      assert_select "input#disease_cientificname[name=?]", "disease[cientificname]"

      assert_select "textarea#disease_causes[name=?]", "disease[causes]"

      assert_select "textarea#disease_description[name=?]", "disease[description]"

      assert_select "textarea#disease_symptoms[name=?]", "disease[symptoms]"
    end
  end
end
