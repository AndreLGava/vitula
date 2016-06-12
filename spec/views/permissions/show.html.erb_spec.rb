require 'rails_helper'

RSpec.describe "permissions/show", type: :view do
  before(:each) do
    @permission = assign(:permission, Permission.create!(
      :create => false,
      :read => false,
      :update => false,
      :delete => false,
      :print => false,
      :modulo => nil,
      :functionality => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
