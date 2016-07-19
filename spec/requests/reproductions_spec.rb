require 'rails_helper'

RSpec.describe 'Reproductions', type: :request do
  describe 'GET /reproductions' do
    it 'works! (now write some real specs)' do
      get reproductions_path
      expect(response).to have_http_status(200)
    end
  end
end
