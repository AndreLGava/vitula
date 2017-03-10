require 'rails_helper'

RSpec.describe "employees/new", type: :view do
  before(:each) do
    assign(:employee, Employee.new(
      :work => "MyString",
      :name => "MyString",
      :phone => "MyString",
      :rg => "MyString",
      :cpf => "MyString",
      :schooling => 1,
      :inss => 1,
      :pis => 1,
      :salary => "9.99",
      :profession => "MyString",
      :payment => 1,
      :property => nil
    ))
  end

  it "renders new employee form" do
    render

    assert_select "form[action=?][method=?]", employees_path, "post" do

      assert_select "input#employee_work[name=?]", "employee[work]"

      assert_select "input#employee_name[name=?]", "employee[name]"

      assert_select "input#employee_phone[name=?]", "employee[phone]"

      assert_select "input#employee_rg[name=?]", "employee[rg]"

      assert_select "input#employee_cpf[name=?]", "employee[cpf]"

      assert_select "input#employee_schooling[name=?]", "employee[schooling]"

      assert_select "input#employee_inss[name=?]", "employee[inss]"

      assert_select "input#employee_pis[name=?]", "employee[pis]"

      assert_select "input#employee_salary[name=?]", "employee[salary]"

      assert_select "input#employee_profession[name=?]", "employee[profession]"

      assert_select "input#employee_payment[name=?]", "employee[payment]"

      assert_select "input#employee_property_id[name=?]", "employee[property_id]"
    end
  end
end
