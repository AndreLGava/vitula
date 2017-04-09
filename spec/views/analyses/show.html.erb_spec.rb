require 'rails_helper'

RSpec.describe "analyses/show", type: :view do
  before(:each) do
    @analysis = assign(:analysis, Analysis.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Codeanalysis/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
