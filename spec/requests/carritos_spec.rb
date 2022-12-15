require "swagger_helper"
require "requests/usuarios_spec"

usuarioInfo = UsuarioInfo.new
newProducto = FactoryBot.create(:producto)

RSpec.describe "carritos", type: :request do
  path "/carritos/{id}" do
    # You'll want to customize the parameter types...
    parameter name: "id",
              in: :path,
              type: :string,
              description: "id del usuario"

    get("ver carrito del usuario") do
      security [{ bearer_auth: [] }]
      tags "Carrito"
      produces "application/json"
      consumes "application/json"

      response(200, "successful") do
        let(:id) { usuarioInfo.usuario_id }
        let(:Authorization) { "Bearer #{usuarioInfo.token}" }

        run_test!
      end
    end

    patch("agregar un producto al carrito") do
      security [{ bearer_auth: [] }]
      tags "Carrito"
      consumes "application/json"

      parameter name: :new_producto,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    nombre_producto: {
                      type: :string
                    },
                    cantidadComprada: {
                      type: :integer
                    }
                  },
                  required: %w[nombre_producto cantidadComprada]
                }

      response(200, "successful") do
        let(:Authorization) { "Bearer #{usuarioInfo.token}" }
        let(:id) { usuarioInfo.usuario_id }

        let(:new_producto) do
          {
            cantidadComprada: Faker::Number.number(digits: 2),
            nombre_producto: newProducto.nombre
          }
        end

        run_test!
      end
    end

    delete("quitar un producto del carrito") do
      security [{ bearer_auth: [] }]
      tags "Carrito"
      consumes "application/json"
      parameter name: :new_producto,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    nombre_producto: {
                      type: :string
                    },
                    cantidadComprada: {
                      type: :number
                    }
                  },
                  required: %w[nombre_producto cantidadComprada]
                }

      response(200, "successful") do
        let(:Authorization) { "Bearer #{usuarioInfo.token}" }
        let(:id) { usuarioInfo.usuario_id }
        let(:new_producto) do
          {
            cantidadComprada: Faker::Number.number(digits: 2),
            nombre_producto: newProducto.nombre
          }
        end

        run_test!
      end
    end
  end

  path "/carritos/comprar/{id}" do
    # You'll want to customize the parameter types...
    parameter name: "id",
              in: :path,
              type: :string,
              description: "id del usuario"

    delete("comprar los productos del carrito") do
      security [{ bearer_auth: [] }]
      tags "Carrito"
      produces "application/json"
      let(:Authorization) { usuarioInfo.token }
      response(200, "successful") do
        let(:Authorization) { "Bearer #{usuarioInfo.token}" }
        let(:id) { usuarioInfo.usuario_id }
        run_test!
      end
    end
  end
end
