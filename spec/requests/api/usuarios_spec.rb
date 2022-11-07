require 'swagger_helper'

RSpec.describe '/usuarios', type: :request do

    path '/login' do
        post 'signup' do
            tags 'Inicio'
        end
    end
end
