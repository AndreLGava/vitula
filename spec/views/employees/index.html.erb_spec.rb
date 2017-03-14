require 'rails_helper'

RSpec.describe "employees/index", type: :view do
  before(:each) do
    assign(:employees, [
      Employee.create!(
        :work => "Work",
        :name => "Name",
        :phone => "Phone",
        :rg => "Rg",
        :cpf => "Cpf",
        :schooling => 1,
        :inss => 2,
        :pis => 3,
        :salary => "9.99",
        :profession => "Profession",
        :payment => 4,
        :property => nil
      ),
      Employee.create!(
        :work => "Work",
        :name => "Name",
        :phone => "Phone",
        :rg => "Rg",
        :cpf => "Cpf",
        :schooling => 1,
        :inss => 2,
        :pis => 3,
        :salary => "9.99",
        :profession => "Profession",
        :payment => 4,
        :property => nil
      )
    ])
  end

  it "renders a list of employees" do
    render
    assert_select "tr>td", :text => "Work".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Rg".to_s, :count => 2
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Profession".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
