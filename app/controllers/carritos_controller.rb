class CarritosController < ApplicationController
  before_action :set_carrito, only: %i[ show update destroy ]

  # GET /carritos
  def index
    @carritos = Carrito.all

    render json: @carritos
  end

  # GET /carritos/1
  def show
    render json: @carrito
  end

  # POST /carritos
  def create
    @carrito = Carrito.new(carrito_params)

    if @carrito.save
      render json: @carrito, status: :created, location: @carrito
    else
      render json: @carrito.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /carritos/1
  def update
    if @carrito.update(carrito_params)
      render json: @carrito
    else
      render json: @carrito.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carritos/1
  def destroy
    @carrito.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carrito
      @carrito = Carrito.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def carrito_params
      params.require(:carrito).permit(:usuario_id, :productos_id)
    end
end
