require 'rails_helper'

RSpec.describe "animals/new", type: :view do
  before(:each) do
    assign(:animal, Animal.new(
      :code => 1,
      name: "MyString",
      :description => "MyString",
      :female => false,
      :breed => "MyString",
      :lot => nil,
      :reproduction => nil
    ))
  end

  it "renders new animal form" do
    render

    assert_select "form[action=?][method=?]", animals_path, "post" do

      assert_select "input#animal_code[name=?]", "animal[code]"

      assert_select "input#animal_name[name=?]", "animal[name]"

      assert_select "input#animal_description[name=?]", "animal[description]"

      assert_select "input#animal_female[name=?]", "animal[female]"

      assert_select "input#animal_breed[name=?]", "animal[breed]"

      assert_select "input#animal_lot_id[name=?]", "animal[lot_id]"

      assert_select "input#animal_reproduction_id[name=?]", "animal[reproduction_id]"
    end
  end
end
