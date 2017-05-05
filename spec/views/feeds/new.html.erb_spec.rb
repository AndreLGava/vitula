require 'rails_helper'

RSpec.describe "feeds/new", type: :view do
  before(:each) do
    assign(:feed, Feed.new(
      :kind => 1,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new feed form" do
    render

    assert_select "form[action=?][method=?]", feeds_path, "post" do

      assert_select "input#feed_kind[name=?]", "feed[kind]"

      assert_select "input#feed_name[name=?]", "feed[name]"

      assert_select "input#feed_description[name=?]", "feed[description]"
    end
  end
end
