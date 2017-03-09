require 'rails_helper'

RSpec.describe "treatments/new", type: :view do
  before(:each) do
    assign(:treatment, Treatment.new(
      :dosage => "9.99",
      :lack => 1
    ))
  end

  it "renders new treatment form" do
    render

    assert_select "form[action=?][method=?]", treatments_path, "post" do

      assert_select "input#treatment_dosage[name=?]", "treatment[dosage]"

      assert_select "input#treatment_lack[name=?]", "treatment[lack]"
    end
  end
end
