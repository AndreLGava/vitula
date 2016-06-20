require 'rails_helper'

RSpec.describe "reproductions/new", type: :view do
  before(:each) do
    assign(:reproduction, Reproduction.new(
      :animal => nil,
      :animal => nil
    ))
  end

  it "renders new reproduction form" do
    render

    assert_select "form[action=?][method=?]", reproductions_path, "post" do

      assert_select "input#reproduction_animal_id[name=?]", "reproduction[animal_id]"

      assert_select "input#reproduction_animal_id[name=?]", "reproduction[animal_id]"
    end
  end
end
