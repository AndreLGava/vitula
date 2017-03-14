require 'rails_helper'

RSpec.describe "employees/show", type: :view do
  before(:each) do
    @employee = assign(:employee, Employee.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Work/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Rg/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Profession/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(//)
  end
end
