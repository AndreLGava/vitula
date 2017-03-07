require 'rails_helper'

RSpec.describe "drugs/new", type: :view do
  before(:each) do
    assign(:drug, Drug.new(
      :name => "MyString",
      :laboratory => "MyString",
      :reference => "MyString",
      :presentation => "MyText",
      :use => "MyText",
      :composition => "MyText",
      :indication => "MyText",
      :contraindication => "MyText",
      :warning => "MyText",
      :interaction => "MyText",
      :effect => "MyText",
      :dosage => "MyText",
      :overdosage => "MyText",
      :properties => "MyText",
      :species => "MyText"
    ))
  end

  it "renders new drug form" do
    render

    assert_select "form[action=?][method=?]", drugs_path, "post" do

      assert_select "input#drug_name[name=?]", "drug[name]"

      assert_select "input#drug_laboratory[name=?]", "drug[laboratory]"

      assert_select "input#drug_reference[name=?]", "drug[reference]"

      assert_select "textarea#drug_presentation[name=?]", "drug[presentation]"

      assert_select "textarea#drug_use[name=?]", "drug[use]"

      assert_select "textarea#drug_composition[name=?]", "drug[composition]"

      assert_select "textarea#drug_indication[name=?]", "drug[indication]"

      assert_select "textarea#drug_contraindication[name=?]", "drug[contraindication]"

      assert_select "textarea#drug_warning[name=?]", "drug[warning]"

      assert_select "textarea#drug_interaction[name=?]", "drug[interaction]"

      assert_select "textarea#drug_effect[name=?]", "drug[effect]"

      assert_select "textarea#drug_dosage[name=?]", "drug[dosage]"

      assert_select "textarea#drug_overdosage[name=?]", "drug[overdosage]"

      assert_select "textarea#drug_properties[name=?]", "drug[properties]"

      assert_select "textarea#drug_species[name=?]", "drug[species]"
    end
  end
end
