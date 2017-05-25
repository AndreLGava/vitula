require 'rails_helper'

RSpec.describe "batchanimals/new", type: :view do
  before(:each) do
    assign(:batchanimal, Batchanimal.new(
      :animal => nil,
      :batch => nil
    ))
  end

  it "renders new batchanimal form" do
    render

    assert_select "form[action=?][method=?]", batchanimals_path, "post" do

      assert_select "input#batchanimal_animal_id[name=?]", "batchanimal[animal_id]"

      assert_select "input#batchanimal_batch_id[name=?]", "batchanimal[batch_id]"
    end
  end
end
