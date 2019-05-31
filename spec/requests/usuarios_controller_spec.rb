require 'rails_helper'

RSpec.describe UsuariosController, type: :request do

  describe 'GET index' do
    before do
      get usuarios_path, params: {}, headers: { 'Accept' => 'application/vnd.api+json' }
    end

    it 'retorna http success' do
      expect(response).to have_http_status(:success)
    end
  end
end