require 'rails_helper'

RSpec.describe "financials/new", type: :view do
  before(:each) do
    assign(:financial, Financial.new(
      :value => "9.99",
      :operation => 1,
      :description => "MyText",
      :animal => nil,
      :service => nil,
      :employee => nil,
      :reproduction => nil,
      :stock => nil,
      :treatment => nil,
      :shipment => nil,
      :schedule => nil,
      :service => nil
    ))
  end

  it "renders new financial form" do
    render

    assert_select "form[action=?][method=?]", financials_path, "post" do

      assert_select "input#financial_value[name=?]", "financial[value]"

      assert_select "input#financial_operation[name=?]", "financial[operation]"

      assert_select "textarea#financial_description[name=?]", "financial[description]"

      assert_select "input#financial_animal_id[name=?]", "financial[animal_id]"

      assert_select "input#financial_service_id[name=?]", "financial[service_id]"

      assert_select "input#financial_employee_id[name=?]", "financial[employee_id]"

      assert_select "input#financial_reproduction_id[name=?]", "financial[reproduction_id]"

      assert_select "input#financial_stock_id[name=?]", "financial[stock_id]"

      assert_select "input#financial_treatment_id[name=?]", "financial[treatment_id]"

      assert_select "input#financial_shipment_id[name=?]", "financial[shipment_id]"

      assert_select "input#financial_schedule_id[name=?]", "financial[schedule_id]"

      assert_select "input#financial_service_id[name=?]", "financial[service_id]"
    end
  end
end
