class UsuariosController < ApplicationController
  #before_action :authorize_request, except: :login

  
  def signup
    

    @usuario = Usuario.create!(
      email: params[:email],
      password: params[:password],
      name: params[:name],
      carrito: Carrito.new,
      compra: Compra.new,
      role: params[:role]
    )
    
    @usuario.password = params[:password]
    
    if @usuario.save 
      token = JsonWebToken.encode(_id: @usuario.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                    email: @usuario.email,
                    nombre: @usuario.name,
                    usuario_id: @usuario.id,
                    compra_id: @usuario.compra.id,
                    carrito_id: @usuario.carrito.id,
                    }, status: :ok
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
                    email: @usuario.email,
                    nombre: @usuario.name,
                    usuario_id: @usuario.id,
                    compra_id: @usuario.compra.id,
                    carrito_id: @usuario.carrito.id
                    }, status: :ok
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
      params.require(:usuario).permit(:email, :password, :name, :role)
    end
end
