require 'rails_helper'

RSpec.describe "Closes", type: :request do
  describe "GET /closes" do
    it "works! (now write some real specs)" do
      get closes_path
      expect(response).to have_http_status(200)
    end
  end
end
