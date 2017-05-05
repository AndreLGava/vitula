require 'rails_helper'

RSpec.describe "Diets", type: :request do
  describe "GET /diets" do
    it "works! (now write some real specs)" do
      get diets_path
      expect(response).to have_http_status(200)
    end
  end
end
