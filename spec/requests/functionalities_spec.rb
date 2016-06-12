require 'rails_helper'

RSpec.describe "Functionalities", type: :request do
  describe "GET /functionalities" do
    it "works! (now write some real specs)" do
      get functionalities_path
      expect(response).to have_http_status(200)
    end
  end
end
