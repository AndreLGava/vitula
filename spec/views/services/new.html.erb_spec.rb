require 'rails_helper'

RSpec.describe "services/new", type: :view do
  before(:each) do
    assign(:service, Service.new(
      :provider => "MyString",
      :goal => "MyString",
      :property => nil
    ))
  end

  it "renders new service form" do
    render

    assert_select "form[action=?][method=?]", services_path, "post" do

      assert_select "input#service_provider[name=?]", "service[provider]"

      assert_select "input#service_goal[name=?]", "service[goal]"

      assert_select "input#service_property_id[name=?]", "service[property_id]"
    end
  end
end
