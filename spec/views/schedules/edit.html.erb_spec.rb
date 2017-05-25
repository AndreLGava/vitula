require 'rails_helper'

RSpec.describe "schedules/edit", type: :view do
  before(:each) do
    @schedule = assign(:schedule, Schedule.create!(
      :event => nil,
      :batch => nil,
      :observation => "MyText"
    ))
  end

  it "renders the edit schedule form" do
    render

    assert_select "form[action=?][method=?]", schedule_path(@schedule), "post" do

      assert_select "input#schedule_event_id[name=?]", "schedule[event_id]"

      assert_select "input#schedule_batch_id[name=?]", "schedule[batch_id]"

      assert_select "textarea#schedule_observation[name=?]", "schedule[observation]"
    end
  end
end
