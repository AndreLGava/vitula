require 'rails_helper'

RSpec.describe "developments/edit", type: :view do
  before(:each) do
    @development = assign(:development, Development.create!(
      :weight => 1.5,
      :height => 1.5,
      :animal => nil
    ))
  end

  it "renders the edit development form" do
    render

    assert_select "form[action=?][method=?]", development_path(@development), "post" do

      assert_select "input#development_weight[name=?]", "development[weight]"

      assert_select "input#development_height[name=?]", "development[height]"

      assert_select "input#development_animal_id[name=?]", "development[animal_id]"
    end
  end
end
