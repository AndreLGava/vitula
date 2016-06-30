require 'rails_helper'

RSpec.describe "notifications/edit", type: :view do
  before(:each) do
    @notification = assign(:notification, Notification.create!(
      :title => "MyString",
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders the edit notification form" do
    render

    assert_select "form[action=?][method=?]", notification_path(@notification), "post" do

      assert_select "input#notification_title[name=?]", "notification[title]"

      assert_select "textarea#notification_description[name=?]", "notification[description]"

      assert_select "input#notification_user_id[name=?]", "notification[user_id]"
    end
  end
end
