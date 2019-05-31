require 'rails_helper'

RSpec.describe PecasController, type: :request do

  describe 'GET index' do
    before do
      get pecas_path, params: {}, headers: { 'Accept' => 'application/vnd.api+json' }
    end

    it 'retorna http' do
      expect(response).to have_http_status(:success)
    end
  end
end
