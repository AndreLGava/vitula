require 'rails_helper'

RSpec.describe "schedules/new", type: :view do
  before(:each) do
    assign(:schedule, Schedule.new(
      :event => nil,
      :batch => nil,
      :observation => "MyText"
    ))
  end

  it "renders new schedule form" do
    render

    assert_select "form[action=?][method=?]", schedules_path, "post" do

      assert_select "input#schedule_event_id[name=?]", "schedule[event_id]"

      assert_select "input#schedule_batch_id[name=?]", "schedule[batch_id]"

      assert_select "textarea#schedule_observation[name=?]", "schedule[observation]"
    end
  end
end
