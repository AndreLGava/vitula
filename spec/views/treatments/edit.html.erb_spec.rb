require 'rails_helper'

RSpec.describe "treatments/edit", type: :view do
  before(:each) do
    @treatment = assign(:treatment, Treatment.create!(
      :dosage => "9.99",
      :lack => 1,
      :illness => nil
    ))
  end

  it "renders the edit treatment form" do
    render

    assert_select "form[action=?][method=?]", treatment_path(@treatment), "post" do

      assert_select "input#treatment_dosage[name=?]", "treatment[dosage]"

      assert_select "input#treatment_lack[name=?]", "treatment[lack]"

      assert_select "input#treatment_illness_id[name=?]", "treatment[illness_id]"
    end
  end
end