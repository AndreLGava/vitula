require 'rails_helper'

RSpec.describe "Batchanimals", type: :request do
  describe "GET /batchanimals" do
    it "works! (now write some real specs)" do
      get batchanimals_path
      expect(response).to have_http_status(200)
    end
  end
end
