class ComprasController < ApplicationController
  before_action :set_venta, only: %i[ show update destroy ]

  # GET /compras
  def index
    @compras = Compra.all
    producto = Producto.where(nombre: params[:producto_attributes][:nombre])
    render json: @compras
  end

  # GET /compras/1
  def show
    render json: @compra
  end

  # POST /compras
  def create
    producto = Producto.where(nombre: params[:producto_attributes][:nombre])
    
    #total: params[:comprado] * producto.precio
    @compra = Compra.create(
      productos: [producto.first],
      comprado: params[:comprado],
      total: params[:comprado] 
      )

    if @compra.save
      render json: @compra, status: :created, location: @compras
    else
      render json: @compra.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /compras/1
  def update
    if @compra.update(venta_params)
      render json: @compra
    else
      render json: @compra.errors, status: :unprocessable_entity
    end
  end

  # DELETE /compras/1
  def destroy
    @compra.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compra
      @compra = Compra.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def compra_params
      params.require(:compra).permit(:comprado, producto_attributes: [:nombre])
    end
end
