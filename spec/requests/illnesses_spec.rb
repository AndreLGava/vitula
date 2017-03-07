require 'rails_helper'

RSpec.describe "Illnesses", type: :request do
  describe "GET /illnesses" do
    it "works! (now write some real specs)" do
      get illnesses_path
      expect(response).to have_http_status(200)
    end
  end
end
