require 'rails_helper'

RSpec.describe "diseases/new", type: :view do
  before(:each) do
    assign(:disease, Disease.new(
      :VulgarName => "MyString",
      :CientificName => "MyString",
      :Causes => "MyText",
      :Description => "MyText",
      :Symptoms => "MyText"
    ))
  end

  it "renders new disease form" do
    render

    assert_select "form[action=?][method=?]", diseases_path, "post" do

      assert_select "input#disease_VulgarName[name=?]", "disease[VulgarName]"

      assert_select "input#disease_CientificName[name=?]", "disease[CientificName]"

      assert_select "textarea#disease_Causes[name=?]", "disease[Causes]"

      assert_select "textarea#disease_Description[name=?]", "disease[Description]"

      assert_select "textarea#disease_Symptoms[name=?]", "disease[Symptoms]"
    end
  end
end
