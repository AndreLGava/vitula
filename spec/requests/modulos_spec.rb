require 'rails_helper'

RSpec.describe "Modulos", type: :request do
  describe "GET /modulos" do
    it "works! (now write some real specs)" do
      get modulos_path
      expect(response).to have_http_status(200)
    end
  end
end
