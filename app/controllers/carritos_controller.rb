class CarritosController < ApplicationController
  before_action :set_carrito, only: %i[ ver_carrito agregar_producto quitar_producto ]
  before_action :set_producto
  
  # GET /carritos/1
  def ver_carrito
    
    render json: @carrito
  end

  #POST /carritos
  def create
    #find or create by Carrito
    #@carrito = Carrito.find_or_create_by()
    @carrito = Carrito.create()

    if @carrito.save
      render json: @carrito
    else
      render json: @carrito.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /carritos/1
  #Agregar productos al carrito
  #Renombrar update -> agregar_producto
  def agregar_producto 
    
    @carrito.update_attributes(
      productos: @carrito.productos.append(@producto),
      cantidadComprada: params[:cantidadComprada]
    )
    if @carrito.update()
      render json: @carrito
    else
      render json: @carrito.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carritos/1
  #destroy -> quitarProducto
  def quitar_producto
    nuevos_productos = @carrito.productos.not.where(nombre: params[:nombre_producto])
    @carrito.update_attributes(
      productos: nuevos_productos
    )
    if @carrito.update
      render json: @carrito
    else
      render json: @carrito.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carrito
      @carrito = Carrito.find(params[:id])
    end

    def set_producto
      @producto = Producto.where(nombre: params[:nombre_producto])
    end

    # Only allow a list of trusted parameters through.
    def carrito_params
      params.require(:carrito).permit(:cantidadComprada,
        :nombre_producto
      )
    end
end
