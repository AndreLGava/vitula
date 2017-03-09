require 'rails_helper'

RSpec.describe "diseases/new", type: :view do
  before(:each) do
    assign(:disease, Disease.new(
      :vulgarname => "MyString",
      :cientificname => "MyString",
      :causes => "MyText",
      :description => "MyText",
      :symptoms => "MyText"
    ))
  end

  it "renders new disease form" do
    render

    assert_select "form[action=?][method=?]", diseases_path, "post" do

      assert_select "input#disease_vulgarname[name=?]", "disease[vulgarname]"

      assert_select "input#disease_cientificname[name=?]", "disease[cientificname]"

      assert_select "textarea#disease_causes[name=?]", "disease[causes]"

      assert_select "textarea#disease_description[name=?]", "disease[description]"

      assert_select "textarea#disease_symptoms[name=?]", "disease[symptoms]"
    end
  end
end
