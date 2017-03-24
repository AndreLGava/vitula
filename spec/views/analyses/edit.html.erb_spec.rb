require 'rails_helper'

RSpec.describe "analyses/edit", type: :view do
  before(:each) do
    @analysis = assign(:analysis, Analysis.create!(
      :property => nil,
      :codeanalysis => "MyString",
      :fat => "9.99",
      :protein => "9.99",
      :lactose => "9.99",
      :totalsolids => "9.99",
      :defattedextract => "9.99",
      :css => "9.99",
      :scorecss => "9.99",
      :ufc => "9.99"
    ))
  end

  it "renders the edit analysis form" do
    render

    assert_select "form[action=?][method=?]", analysis_path(@analysis), "post" do

      assert_select "input#analysis_property_id[name=?]", "analysis[property_id]"

      assert_select "input#analysis_codeanalysis[name=?]", "analysis[codeanalysis]"

      assert_select "input#analysis_fat[name=?]", "analysis[fat]"

      assert_select "input#analysis_protein[name=?]", "analysis[protein]"

      assert_select "input#analysis_lactose[name=?]", "analysis[lactose]"

      assert_select "input#analysis_totalsolids[name=?]", "analysis[totalsolids]"

      assert_select "input#analysis_defattedextract[name=?]", "analysis[defattedextract]"

      assert_select "input#analysis_css[name=?]", "analysis[css]"

      assert_select "input#analysis_scorecss[name=?]", "analysis[scorecss]"

      assert_select "input#analysis_ufc[name=?]", "analysis[ufc]"
    end
  end
end
