require 'rails_helper'

RSpec.describe "services/edit", type: :view do
  before(:each) do
    @service = assign(:service, Service.create!(
      :provider => "MyString",
      :goal => "MyString",
      :property => nil
    ))
  end

  it "renders the edit service form" do
    render

    assert_select "form[action=?][method=?]", service_path(@service), "post" do

      assert_select "input#service_provider[name=?]", "service[provider]"

      assert_select "input#service_goal[name=?]", "service[goal]"

      assert_select "input#service_property_id[name=?]", "service[property_id]"
    end
  end
end
