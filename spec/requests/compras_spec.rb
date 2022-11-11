require 'swagger_helper'

RSpec.describe 'compras', type: :request do


  path '/compras/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id del usuario'

    get('Mostrar las compras que ha hecho el usuario') do
      tags "Compras"
      security [Bearer: []]
      response '204', 'Valid credentials' do
        let(:Authorization) { "Basic #{::Base64.strict_encode64('jsmith:jspass')}" }
        let(:api_key) { 'foobar' }
        run_test!
      end
    end

  end
end
