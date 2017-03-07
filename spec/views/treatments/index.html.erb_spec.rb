require 'rails_helper'

RSpec.describe "treatments/index", type: :view do
  before(:each) do
    assign(:treatments, [
      Treatment.create!(
        :dosage => "9.99",
        :lack => 1,
        :illness => nil
      ),
      Treatment.create!(
        :dosage => "9.99",
        :lack => 1,
        :illness => nil
      )
    ])
  end

  it "renders a list of treatments" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
