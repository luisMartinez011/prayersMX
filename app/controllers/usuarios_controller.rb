class UsuariosController < ApplicationController
  before_action :set_usuario, only: %i[ show update destroy ]


  # POST /usuarios
  def create
    @usuario = Usuario.new(usuario_params)
    @usuario.password = params[:password]
    if @usuario.save
      render body: "Please check your email for confirmation instructions.",
      status: :created, location: @usuario
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @usuario = Usuario.new
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
