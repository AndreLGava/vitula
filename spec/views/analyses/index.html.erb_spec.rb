require 'rails_helper'

RSpec.describe "analyses/index", type: :view do
  before(:each) do
    assign(:analyses, [
      Analysis.create!(
        :property => nil,
        :codeanalysis => "Codeanalysis",
        :fat => "9.99",
        :protein => "9.99",
        :lactose => "9.99",
        :totalsolids => "9.99",
        :defattedextract => "9.99",
        :css => "9.99",
        :scorecss => "9.99",
        :ufc => "9.99"
      ),
      Analysis.create!(
        :property => nil,
        :codeanalysis => "Codeanalysis",
        :fat => "9.99",
        :protein => "9.99",
        :lactose => "9.99",
        :totalsolids => "9.99",
        :defattedextract => "9.99",
        :css => "9.99",
        :scorecss => "9.99",
        :ufc => "9.99"
      )
    ])
  end

  it "renders a list of analyses" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Codeanalysis".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
