class VentasController < ApplicationController
  before_action :set_venta, only: %i[ show update destroy ]

  # GET /ventas
  def index
    @ventas = Venta.all
    producto = Producto.where(nombre: params[:producto_attributes][:nombre])
    render json: @ventas
  end

  # GET /ventas/1
  def show
    render json: @venta
  end

  # POST /ventas
  def create
    producto = Producto.where(nombre: params[:producto_attributes][:nombre])
    
    #total: params[:comprado] * producto.precio
    @venta = Venta.create(
      productos: [producto.first],
      comprado: params[:comprado],
      total: params[:comprado] 
      )

    if @venta.save
      render json: @venta, status: :created, location: @ventas
    else
      render json: @venta.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ventas/1
  def update
    if @venta.update(venta_params)
      render json: @venta
    else
      render json: @venta.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ventas/1
  def destroy
    @venta.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venta
      @venta = Venta.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def venta_params
      params.require(:venta).permit(:comprado, producto_attributes: [:nombre])
    end
end
