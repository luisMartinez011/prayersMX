require "swagger_helper"

$newUsuario = FactoryBot.build(:usuario, name: "jinsang")
RSpec.describe "usuarios", type: :request do
  path "/usuarios/signup" do
    post("signup usuario") do
      tags "Usuario"
      consumes "application/json"
      parameter name: :new_usuario,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    email: {
                      type: :string
                    },
                    password: {
                      type: :string
                    },
                    name: {
                      type: :string
                    }
                  },
                  required: %w[email password name]
                }

      response(200, "successful") do
        #newUsuario = FactoryBot.create(:usuario)

        let(:new_usuario) { $newUsuario }
        # let(:new_usuario) { { email: "admin2@gmail.com", password: "dfdf" } }
        # after do |example|
        #   example.metadata[:response][:content] = {
        #     "application/json" => {
        #       example: JSON.parse(response.body, symbolize_names: true)
        #     }
        #   }
        # end

        run_test! do |response|
          data = JSON.parse(response.body)
          $usuarioToken = data["token"]
          expect(data["nombre"]).to eq("jinsang")
        end
      end

      # response(422, "bad parameters") do
      #   let(:new_usuario) { { email: "admin", password: "contra" } }
      #   run_test!
      # end
    end
  end

  path "/usuarios/login" do
    post("login usuario") do
      tags "Usuario"
      consumes "application/json"
      parameter name: :new_usuario,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    email: {
                      type: :string
                    },
                    password: {
                      type: :string
                    }
                  },
                  required: %w[email password]
                }

      response(200, "successful") do
        let(:new_usuario) { $newUsuario }
        run_test!
      end
    end
  end
end
