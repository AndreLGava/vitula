require 'rails_helper'

RSpec.describe "batches/new", type: :view do
  before(:each) do
    assign(:batch, Batch.new(
      :name => "MyString",
      :observation => "MyText",
      :type => 1,
      :glebe => nil
    ))
  end

  it "renders new batch form" do
    render

    assert_select "form[action=?][method=?]", batches_path, "post" do

      assert_select "input#batch_name[name=?]", "batch[name]"

      assert_select "textarea#batch_observation[name=?]", "batch[observation]"

      assert_select "input#batch_type[name=?]", "batch[type]"

      assert_select "input#batch_glebe_id[name=?]", "batch[glebe_id]"
    end
  end
end
