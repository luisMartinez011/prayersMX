require "swagger_helper"
require "requests/usuarios_spec"

usuarioInfo = UsuarioInfo.new

RSpec.describe "compras", type: :request do
  path "/compras/{id}" do
    # You'll want to customize the parameter types...
    parameter name: "id",
              in: :path,
              type: :string,
              description: "id del usuario"

    get("Mostrar las compras que ha hecho el usuario") do
      security [{ bearer_auth: [] }]
      tags "Compras"
      response(200, "successful") do
        let(:Authorization) { "Bearer #{usuarioInfo.token}" }
        let(:id) { usuarioInfo.usuario_id }
        run_test!
      end
    end
  end
end
