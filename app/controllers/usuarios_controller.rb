class UsuariosController < ApplicationController
  #before_action :authorize_request, except: :login

  
  def signup
    
    @usuario = Usuario.create!(
      email: params[:email],
      password: params[:password],
      carrito: Carrito.new
    )
    
    #@usuario.carrito = Carrito.new
    @usuario.password = params[:password]
    
    if @usuario.save 
      
      token = JsonWebToken.encode(_id: @usuario.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: @usuario.email }, status: :ok
    else
      render :new, status: :unprocessable_entity
    end
  end

  def login
    @usuario = Usuario.where(email: params[:email]).first()
    # render json: @usuario
    if @usuario.password == params[:password]
      token = JsonWebToken.encode(_id: @usuario.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: @usuario.email }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def usuario_params
      params.require(:usuario).permit(:email, :password)
    end
end
