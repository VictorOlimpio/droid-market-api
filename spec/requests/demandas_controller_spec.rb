require 'rails_helper'

RSpec.describe DemandasController, type: :request do

  describe 'GET index' do
    before do
      get demandas_path, params: {}, headers: { 'Accept' => 'application/vnd.api+json' }
    end

    context 'não autenticado' do
      it 'retorna http unauthorized' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
