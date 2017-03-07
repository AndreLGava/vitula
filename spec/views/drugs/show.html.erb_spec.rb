require 'rails_helper'

RSpec.describe "drugs/show", type: :view do
  before(:each) do
    @drug = assign(:drug, Drug.create!(
      :name => "Name",
      :laboratory => "Laboratory",
      :reference => "Reference",
      :presentation => "MyText",
      :use => "MyText",
      :composition => "MyText",
      :indication => "MyText",
      :contraindication => "MyText",
      :warning => "MyText",
      :interaction => "MyText",
      :effect => "MyText",
      :dosage => "MyText",
      :overdosage => "MyText",
      :properties => "MyText",
      :species => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Laboratory/)
    expect(rendered).to match(/Reference/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
