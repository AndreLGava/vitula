require 'rails_helper'

RSpec.describe "batchanimals/edit", type: :view do
  before(:each) do
    @batchanimal = assign(:batchanimal, Batchanimal.create!(
      :animal => nil,
      :batch => nil
    ))
  end

  it "renders the edit batchanimal form" do
    render

    assert_select "form[action=?][method=?]", batchanimal_path(@batchanimal), "post" do

      assert_select "input#batchanimal_animal_id[name=?]", "batchanimal[animal_id]"

      assert_select "input#batchanimal_batch_id[name=?]", "batchanimal[batch_id]"
    end
  end
end
