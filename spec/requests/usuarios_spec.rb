require 'swagger_helper'

RSpec.describe 'usuarios', type: :request do
  
  path '/usuarios/signup' do
    
    post('signup usuario') do
      tags "Usuario"
      consumes 'application/json'
      parameter name: :new_usuario, in: :body, schema: { 
        type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string },
              name: { type: :string },
            },
        required: [ "email", "password", "name"]
      }

      response(200, 'successful') do
        
        let(:usuario){ Usuario.create(email: "admin2@gmail.com", password: "dfdf")}
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(422, 'bad parameters') do
        
        let(:usuario){ { email: 'admin', password: 'contra'}}
        run_test!
      end
    end
  end

  path '/usuarios/login' do

    post('login usuario') do
      tags "Usuario"
      consumes 'application/json'
      parameter name: :new_usuario, in: :body, schema: { 
        type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string },
              name: { type: :string },
            },
        required: [ "email", "password", "name"]
      }
      
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
