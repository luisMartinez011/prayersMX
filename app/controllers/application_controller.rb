class ApplicationController < ActionController::API
    
    alias_method :current_user, :current_usuario
    
    def not_found
        render json: { error: 'not_found' }
    end
    
    def authorize_request
      header = request.headers['Authorization']
      header = header.split(' ').last if header
      begin
        @decoded = JsonWebToken.decode(header)
        # @current_user = Usuario.find(@decoded[:_id])
      rescue ActiveRecord::RecordNotFound => e
        render json: { errors: e.message }, status: :unauthorized
      rescue JWT::DecodeError => e
        render json: { errors: e.message }, status: :unauthorized
      end
    end
end
