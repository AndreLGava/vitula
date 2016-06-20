require 'rails_helper'

RSpec.describe "reproductions/edit", type: :view do
  before(:each) do
    @reproduction = assign(:reproduction, Reproduction.create!(
      :animal => nil,
      :animal => nil
    ))
  end

  it "renders the edit reproduction form" do
    render

    assert_select "form[action=?][method=?]", reproduction_path(@reproduction), "post" do

      assert_select "input#reproduction_animal_id[name=?]", "reproduction[animal_id]"

      assert_select "input#reproduction_animal_id[name=?]", "reproduction[animal_id]"
    end
  end
end
