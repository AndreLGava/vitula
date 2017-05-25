require 'rails_helper'

RSpec.describe "batches/edit", type: :view do
  before(:each) do
    @batch = assign(:batch, Batch.create!(
      :name => "MyString",
      :observation => "MyText",
      :type => 1,
      :glebe => nil
    ))
  end

  it "renders the edit batch form" do
    render

    assert_select "form[action=?][method=?]", batch_path(@batch), "post" do

      assert_select "input#batch_name[name=?]", "batch[name]"

      assert_select "textarea#batch_observation[name=?]", "batch[observation]"

      assert_select "input#batch_type[name=?]", "batch[type]"

      assert_select "input#batch_glebe_id[name=?]", "batch[glebe_id]"
    end
  end
end
