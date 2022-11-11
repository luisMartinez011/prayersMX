require 'swagger_helper'

RSpec.describe 'carritos', type: :request do

  path '/carritos/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id del usuario'

    get('ver carrito del usuario') do
      tags "Carrito"
      produces  'application/json'
      security [Bearer: []]

      let(:Authorization) { auth_header(user) }
      response(200, 'successful') do
        let(:id) { '123' }

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

    patch('agregar un producto al carrito') do
      tags "Carrito"
      consumes 'application/json'
      security [Bearer: []]
      parameter name: :new_producto, in: :body, schema: { 
        type: :object,
            properties: {
              nombre_producto: { type: :string },
              cantidadComprada: { type: :integer }
            },
        required: [ "nombre_producto", "cantidadComprada"]
      }
      response(200, 'successful') do
        let(:id) { '123' }

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

    delete('quitar un producto del carrito') do
      tags "Carrito"
      consumes  'application/json'
      security [Bearer: []]
      parameter name: :new_producto, in: :body, schema: { 
        type: :object,
            properties: {
              nombre_producto: { type: :string }
            },
        required: [ "nombre_producto"]
      }
      response(200, 'successful') do
        let(:id) { '123' }

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


  path '/carritos/comprar/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id del usuario'

    delete('comprar los productos del carrito') do
      tags "Carrito"
      produces  'application/json'
      security [Bearer: []]
      response(200, 'successful') do
        let(:id) { '123' }

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
