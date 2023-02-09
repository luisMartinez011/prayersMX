 require "swagger_helper"

newUsuario = FactoryBot.build(:usuario, name: "jinsang")
usuario_with_user_role = FactoryBot.create(:usuario, role: "user")
class UsuarioInfo
  def usuario_id
    return $usuarioId
  end
  def token
    return $usuarioToken
  end
end

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
        let(:new_usuario) { newUsuario }
        run_test!
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
        let(:new_usuario) { newUsuario }
        run_test! do |response|
          data = JSON.parse(response.body)

          $usuarioToken = data["token"]
          $usuarioId = assigns(:usuario).id
          expect(data["nombre"]).to eq("jinsang")
        end
      end
    end
  end
end
